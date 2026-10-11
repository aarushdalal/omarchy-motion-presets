import importlib.machinery
import importlib.util
import json,os,shutil,subprocess,tempfile,unittest
from pathlib import Path
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
def load(name,path):
 loader=importlib.machinery.SourceFileLoader(name,str(path));spec=importlib.util.spec_from_loader(name,loader)
 module=importlib.util.module_from_spec(spec);loader.exec_module(module);return module

class RefinementTests(unittest.TestCase):
 def test_motion_invalid_and_read_queries_do_not_write(self):
  with tempfile.TemporaryDirectory() as folder:
   env=dict(os.environ,HOME=folder,XDG_CONFIG_HOME=folder+'/config',XDG_STATE_HOME=folder+'/state')
   env.pop('HYPRLAND_INSTANCE_SIGNATURE',None)
   cli=ROOT/'bin/omarchy-animation-style'
   self.assertEqual(subprocess.run([cli,'current'],env=env,capture_output=True).returncode,0)
   self.assertNotEqual(subprocess.run([cli,'set','../invalid'],env=env,capture_output=True).returncode,0)
   self.assertFalse(Path(folder+'/state').exists())

 def test_motion_all_presets_and_rollback(self):
  with tempfile.TemporaryDirectory() as folder:
   root=Path(folder);config=root/'config/hypr';state=root/'state/omarchy'
   shutil.copytree(ROOT/'animations',config/'animations')
   env=dict(os.environ,HOME=folder,XDG_CONFIG_HOME=str(root/'config'),XDG_STATE_HOME=str(root/'state'))
   env.pop('HYPRLAND_INSTANCE_SIGNATURE',None)
   cli=ROOT/'bin/omarchy-animation-style'
   for source in (config/'animations').glob('*.lua'):
    self.assertEqual(subprocess.run([cli,'set',source.stem],env=env,capture_output=True).returncode,0)
    subprocess.run(['luac','-p',str(config/'animations.lua')],check=True,capture_output=True)
   target=config/'animations.lua';before=target.read_bytes();selected=(state/'animation-style').read_bytes()
   binary=root/'bin';binary.mkdir();stub=binary/'hyprctl'
   stub.write_text('#!/bin/sh\nexit 9\n');stub.chmod(0o755)
   env.update(PATH=str(binary)+':'+os.environ['PATH'],HYPRLAND_INSTANCE_SIGNATURE='fixture')
   self.assertNotEqual(subprocess.run([cli,'set','cosmic'],env=env,capture_output=True).returncode,0)
   self.assertEqual(target.read_bytes(),before);self.assertEqual((state/'animation-style').read_bytes(),selected)

if __name__=="__main__": unittest.main(verbosity=2)
