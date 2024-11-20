  -- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local is_macos = wezterm.target_triple:find("darwin") ~= nil

if is_macos == false then
    config.default_prog = { 'ubuntu' }
end
-- This will hold the configuration.
config.window_background_opacity = 0.67
config.macos_window_background_blur = 20

-- This is where you actually apply your config choice
config.font_size = 14.5
config.font = wezterm.font 'CaskaydiaCove Nerd Font'
-- config.font = wezterm.font 'DepartureMono Nerd Font'
-- For example, changing the color scheme:
config.color_scheme = 'kanagawabones'
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
local act = wezterm.action

config.keys = {
  {
      key = '9',
      mods = 'CTRL',
      action = act.PaneSelect {
        alphabet = '1234567890',
      }
  },
  {
      key = 'LeftArrow',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
      key = 'DownArrow',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Down', 5 },
  },
  {
      key = 'UpArrow',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Up', 5 }
    },
  {
      key = 'RightArrow',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
}

return config
