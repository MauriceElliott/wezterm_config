local wezterm = require 'wezterm'
local config = {}

config.wsl_domains = {
  {
    name = 'WSL',
    distribution = 'gentoo',
  },
}
config.default_prog = { 'wsl' }
config.font_size = 11

config.window_background_opacity = 0.8
config.font = wezterm.font('Annotation Mono')
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
      mods = 'CTRL|SHIFT',
      action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = act.AdjustPaneSize { 'Down', 5 },
  },
  {
      key = 'UpArrow',
      mods = 'CTRL|SHIFT',
      action = act.AdjustPaneSize { 'Up', 5 }
    },
  {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = '+',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = ':',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      command = { args = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' } },
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
