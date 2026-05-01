# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Reload bar after any config change
sketchybar --reload

# Tail live logs for debugging
sketchybar --log level=debug 2>&1 | tail -f

# Query an item's current state
sketchybar --query <item_name>

# Trigger a plugin manually
sketchybar --trigger <event_name>
```

## Architecture

### Entry point
`sketchybarrc` — sourced on startup. Sets bar appearance, defaults, then sources every item file. Left side items first, right side after. Ends by defining brackets (grouped visual containers) and subscribing the bar itself to yabai events for auto-hide on fullscreen.

### Two-file pattern per widget
Each widget has two files:
- `items/<name>.sh` — declares the sketchybar item(s), sets static properties, and wires up events via `--subscribe`
- `plugins/<name>.sh` — the runtime script executed when a subscribed event fires; reads env vars (`$SENDER`, `$INFO`, `$NAME`, `$PERCENTAGE`, `$SCROLL_DELTA`, etc.) and calls `sketchybar --set` to update state

### Shared config
- `colors.sh` — all color hex values exported as env vars (`$RED`, `$BLUE`, `$BACKGROUND_1`, etc.)
- `icons.sh` — SF Symbol characters exported as env vars (`$WIFI_CONNECTED`, `$BATTERY_100`, etc.)
- Both are sourced at the top of `sketchybarrc` and re-sourced inside plugins that need them

### Event model
Items subscribe to named events. When an event fires, sketchybar sets `$SENDER` to the event name and calls the item's `script`. Common events:
- `volume_change`, `power_source_change`, `system_woke` — OS-level, built-in
- `front_app_switched`, `window_focus` — yabai integration
- `mouse.clicked`, `mouse.scrolled` — user interaction; `$SCROLL_DELTA` is an integer (positive = up)
- Custom events declared with `--add event` in `sketchybarrc`

### Popup pattern
Popups attach to a parent item. Add child items with position `popup.<parent_name>`. Toggle visibility with `--set <parent> popup.drawing=toggle`. See `items/volume.sh` for a working example.

### Bracket pattern
Brackets group items into a shared background. Defined after all items are added in `sketchybarrc`. Item names inside must exactly match those added via `--add item`.

### Bar auto-hide
`scripts/toggle_bar.sh` is subscribed to yabai window events. Hides the bar when the focused window is fullscreen, shows it otherwise. Requires yabai running.

### CPU graphs
Three linked items: `cpu.percent` (label), `cpu.sys` (graph), `cpu.user` (graph). Only `cpu.user` has a `script` — `plugins/cpu.sh` runs there and pushes data to both graphs via `--push`.

### WiFi
Single item `wifi` with `plugins/wifi.sh` handling both the icon (`$WIFI_CONNECTED`/`$WIFI_DISCONNECTED`) and the SSID label. Reads from `en0` via `ipconfig getsummary`.
