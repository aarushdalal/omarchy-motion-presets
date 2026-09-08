# Showcase Assets Directory

This directory stores visual assets and previews for documentation and GitHub releases.

## Asset Guidelines

- **UI Screenshots**: Use high-resolution PNG format (`.png`) with clean scaling.
- **Wallpapers / Photos**: WebP format (`.webp`) is recommended for photographic assets when file size optimization is needed.
- **Short Motion / Loops**: Use lightweight, optimized GIFs (`.gif`) for UI interactions and micro-animations.
- **Longer Demos & Videos**: Upload MP4 (`.mp4`, H.264/AAC) or WebM (`.webm`) videos to GitHub Releases and embed a clickable video thumbnail in the README.
- **Sanitization Checklist**:
  - [ ] Remove all personal usernames, real names, hostnames, and IP addresses.
  - [ ] Ensure no secret keys, tokens, OAuth scopes, or credentials are visible.
  - [ ] Remove desktop notification popups and personal browser history/bookmarks.
  - [ ] Verify redistribution rights: do NOT bundle copyrighted anime, automotive, or third-party trademarked artwork.

## Naming Conventions

- Plugin UI screenshots: `plugin_tabname.png` (e.g., `time_machine_timeline.png`, `sync_overview.png`)
- Custom wallpapers: `wallpaper_name.png` (user-supplied in `~/.config/omarchy/themes/<theme-slug>/backgrounds/`)
- Hero preview: `hero.png`
- Feature preview: `feature-01.png`, `feature-02.png`
- Motion previews: `interaction-01.gif`, `interaction-02.gif`
