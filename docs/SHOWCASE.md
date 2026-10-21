# Recorded showcases

The gallery contains 19 historical recordings of Motion Presets, restored from the local showcase archive. These clips demonstrate the recorded version; they do not establish compatibility with a newer desktop release.

- `assets/showcase/<name>.mp4`: full-length silent H.264 video, 960 pixels wide, 30 FPS, with fast-start playback.
- `assets/showcase/previews/<name>.gif`: looping 480-pixel, 12 FPS excerpt for GitHub README previews.
- `assets/showcase/previews/<name>.jpg`: still poster for the optional HTML gallery.
- `index.html`: video gallery with explicit playback controls and no autoplay.

The README uses repository-relative GIF images and links to matching players in the GitHub Pages gallery. The videos are also available as MP4 downloads in the repository. The HTML gallery works when served from the repository root by any static web server.

Audio streams and source metadata are removed. The desktop status bar is cropped from the motion clips. The original local recordings remain unchanged.

The published MP4, GIF and JPEG files are reviewed outputs recorded by SHA-256 in `tools/approved-preview-media.json`. The release privacy check rejects new or changed media until reviewed. Run `python3 tools/release_privacy_check.py` before publication.
