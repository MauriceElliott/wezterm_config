  -- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local is_macos = wezterm.target_triple:find("darwin") ~= nil


if is_macos == false then
  config.wsl_domains = {
    {
      -- The name of this specific domain.  Must be unique amonst all types
      -- of domain in the configuration file.
      name = 'WSL:Ubuntu',
  
      -- The name of the distribution.  This identifies the WSL distribution.
      -- It must match a valid distribution from your `wsl -l -v` output in
      -- order for the domain to be useful.
      distribution = 'Ubuntu',
    },
  }
  config.default_domain = 'WSL:Ubuntu'
  config.default_prog = { 'ubuntu' }
  config.font_size = 11
else
  config.macos_window_background_blur = 10
  config.font_size = 14
end

config.window_background_opacity = 0.90
config.font = wezterm.font 'Cascadia Code'
config.colors = {
  foreground = '#DFEBF5',
  background = '#080703',
  cursor_bg = '#DAE3EB',
  cursor_fg = '#0F2733',
  cursor_border = '#DAE3EB',
  selection_fg = '#DAE3EB',
  selection_bg = '#0F2733',
  scrollbar_thumb = '#080703',
  split = '#0F2733',
  ansi = {
    '#0F2733', -- Black
    '#694D39', -- Red
    '#72AB4D', -- Green
    '#CC6114', -- Yellow
    '#2B5A73', -- Blue
    '#73456B', -- Purple
    '#43BFAB', -- Cyan
    '#D5DDE3', -- White
  },
  brights = {
    '#1B465C', -- Light Black
    '#D4735F', -- Light Red
    '#9DC489', -- light Green
    '#DAED61', -- Light Yellow
    '#628BC4', -- Light Blue
    '#D19BCD', -- Light Purple
    '#74B0CF', -- Light Cyan
    '#DFEBF5', -- Light White
  },
  compose_cursor = '#DAED61',
  copy_mode_active_highlight_bg = { Color = '#DAE3EB' },
  copy_mode_active_highlight_fg = { Color = '#0F2733' },
  copy_mode_inactive_highlight_bg = { Color = '#9EA5AB' },
  copy_mode_inactive_highlight_fg = { Color = '#1B465C' },
  quick_select_label_fg = { Color = '#DAE3EB' },
  quick_select_label_bg = { Color = '#694D39' },
  quick_select_match_bg = { Color = '#694D39' },
  quick_select_match_fg = { Color = '#DAE3EB' },
}

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
  {
    key = '_',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = '+',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
    {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false},
  },
}

return config
