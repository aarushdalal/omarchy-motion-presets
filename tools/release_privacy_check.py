#!/usr/bin/env python3
"""Scan the current release payload without printing sensitive matched values."""
import hashlib,json,re,subprocess,sys,os
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
PATTERNS={
 'private home path':rb'/home/(?!user(?:/|\b)|example(?:/|\b)|username(?:/|\b))[A-Za-z0-9_.-]+|/Users/[A-Za-z0-9_.-]+',
 'private contact':rb'[A-Za-z0-9_.+-]+@(?:gmail|outlook|hotmail|yahoo|protonmail|proton)\.com',
 'private network address':rb'\b(?:192\.168\.[0-9]+\.[0-9]+|10\.[0-9]+\.[0-9]+\.[0-9]+)\b',
 'hardware address':rb'\b(?:[0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}\b',
 'credential':rb'-----BEGIN (?:OPENSSH|RSA|EC|DSA)? ?PRIVATE KEY-----|\b(?:gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{30,}|sk-[A-Za-z0-9_-]{30,}|AIza[A-Za-z0-9_-]{30,})',
 'coordinate':rb'["\x27]?(?:latitude|longitude|lat|lon)["\x27]?\s*[:=]\s*-?\d{1,3}\.\d{3,}',
}
IGNORED={'.git','__pycache__','node_modules','.venv','.cache'}
FORBIDDEN={'.git-corrupted','rclone.conf','cookies.txt','credentials.json','identity.pem','id_rsa','id_ed25519'}
def check(root):
 failures=[];count=0
 approved_file=root/'tools/approved-preview-media.json'
 approved=json.loads(approved_file.read_text()) if approved_file.exists() else {}
 for file in root.rglob('*'):
  relative=file.relative_to(root)
  if any(part in IGNORED for part in relative.parts):continue
  if any(part in FORBIDDEN for part in relative.parts) or file.name=='.env' or file.name.startswith('.env.'):
   failures.append((str(relative),'runtime/credential material'));continue
  if not file.is_file():continue
  if file.is_symlink():
   target=os.readlink(file)
   if os.path.isabs(target) or not file.resolve().is_relative_to(root.resolve()): failures.append((str(relative),'release symlink requires review'))
   continue
  if 'showcase' in relative.parts and file.suffix.lower() in {'.png','.jpg','.jpeg','.gif','.webm','.mp4'}:
   if approved.get(str(relative)) != hashlib.sha256(file.read_bytes()).hexdigest():failures.append((str(relative),'unreviewed showcase media'))
  if file.stat().st_size>8*1024*1024:continue
  data=file.read_bytes();count+=1
  for category,pattern in PATTERNS.items():
   if re.search(pattern,data,re.I):failures.append((str(relative),category))
 return count,failures

if __name__=='__main__':
 count,failures=check(ROOT)
 for path,category in failures:print(f'{path}: {category}',file=sys.stderr)
 print(f'Checked {count} current payload files; {len(failures)} release privacy findings.')
 sys.exit(bool(failures))
