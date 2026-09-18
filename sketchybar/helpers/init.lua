-- Add the sketchybar module to the package cpath
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"

-- Build helper binaries only when missing, never on every reload.
-- Rebuilding with clang on each reload blocks display add/remove recovery.
-- Rebuild manually with: (cd "$CONFIG_DIR/helpers/event_providers" && make)
local function helper_binary_missing()
  local config = os.getenv("CONFIG_DIR") or (os.getenv("HOME") .. "/.config/sketchybar")
  local base = config .. "/helpers/event_providers/"
  local bins = {
    base .. "cpu_load/bin/cpu_load",
    base .. "network_load/bin/network_load",
    base .. "window_focus/bin/window_focus",
  }
  for _, bin in ipairs(bins) do
    local f = io.open(bin, "r")
    if f then f:close() else return true end
  end
  return false
end

if helper_binary_missing() then
  os.execute("(cd helpers && make)")
end
