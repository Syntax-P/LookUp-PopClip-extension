# LookUp Dictionary - PopClip Extension

A [PopClip](https://www.popclip.app) extension that looks up the selected word in [LookUp – English Dictionary](https://apps.apple.com/us/app/lookup-english-dictionary/id872564448).

## What it does

Select any word, click the book icon in PopClip, and the extension will:

- Copy the selected word to the clipboard
- Open LookUp (launching it if not already running)
- Focus the search bar and paste the word automatically, triggering an immediate search

## Requirements

- [PopClip](https://www.popclip.app)
- [LookUp – English Dictionary](https://apps.apple.com/us/app/lookup-english-dictionary/id872564448) (Mac App Store)

## Installation

1. Clone or download this repo
2. Rename the folder to `LookUp.popclipext` (must end in `.popclipext`)
3. Double-click the folder - PopClip will prompt you to install it

## Files

| File | Purpose |
|------|---------|
| `Config.yaml` | Extension metadata and action definition |
| `search.sh` | Shell script that copies the word and triggers LookUp via AppleScript |

## How it works

PopClip sets `$POPCLIP_TEXT` to the selected word. `search.sh` copies it to the clipboard, then uses AppleScript with `System Events` to automate the LookUp UI - focusing the search field (`⌘F`), pasting the word (`⌘V`), and pressing Enter.

A `sleep 1` pause after `open -a "LookUp"` gives the app time to fully load before AppleScript tries to interact with it. The delays between keystrokes ensure the UI keeps up.

> **Note:** This extension uses UI scripting via `System Events`, which requires **Accessibility permissions**. If it doesn't work, go to **System Settings → Privacy & Security → Accessibility** and make sure PopClip (or Terminal, depending on how you run it) is enabled.

## License

MIT