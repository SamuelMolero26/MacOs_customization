# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Reload Config

```sh
yabai --restart-service
# or send signal if already running:
launchctl kickstart -k "gui/${UID}/org.nixos.yabai"
```

## Structure

Single file repo: `yabairc` — sourced by yabai on start/restart.

## Architecture

- **Layout**: BSP (binary space partitioning), `second_child` placement
- **Gaps**: 12px all sides, 14px top (leaves room for SketchyBar at `external_bar all:32:0`)
- **Mouse**: `ctrl` modifier — left drag moves, right drag resizes, drop-to-stack enabled
- **Unmanaged apps**: System Settings, Calculator, iTerm2, Music, Messages, VSCode, RStudio, Discord, Goodnotes, Stickies, Proton VPN — all float (`manage=off`)
- **Auto-balance**: off (manual splits)

## Key Constraint

`external_bar all:32:0` — 32px top bar reserved for SketchyBar. Match this if changing padding.
