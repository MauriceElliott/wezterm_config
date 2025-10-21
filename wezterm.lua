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

config.window_background_opacity = 0.99
config.font = wezterm.font('Ioskeley Mono')
config.color_scheme = 'Ayu Dark (Gogh)'

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
