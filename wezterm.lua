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

config.window_background_opacity = 1
config.font = wezterm.font('Annotation Mono')

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

config.color_schemes = {
  ['Automata Day'] = {
    foreground = '#1F1E1E',
    background = '#DAD4BA',
    cursor_bg = '#33251F',
    cursor_fg = '#DAD4BA',
    cursor_border = '#33251F',
    selection_fg = '#1F1E1E',
    selection_bg = '#EBE6D2',
    scrollbar_thumb = '#918E82',
    split = '#918E82',
    ansi = {
      '#1F1E1E', -- black
      '#52212C', -- red
      '#1B3B26', -- green
      '#B67F21', -- yellow
      '#3A4A67', -- blue
      '#5B437A', -- magenta/purple
      '#3D6B6B', -- cyan/aqua
      '#CDC8B0', -- white
    },
    brights = {
      '#33251F', -- bright black
      '#732127', -- bright red
      '#406647', -- bright green
      '#ADAD39', -- bright yellow
      '#466A82', -- bright blue
      '#8C485A', -- bright magenta/purple
      '#2B797A', -- bright cyan/aqua
      '#EBE6D2', -- bright white
    },
  },
     ['Automata Night'] = {
     foreground = '#E0DBC1',
     background = '#1A1313',
     cursor_bg = '#FAF4DE',
     cursor_fg = '#1A1313',
     cursor_border = '#FAF4DE',
     selection_fg = '#FAF4DE',
     selection_bg = '#5C3016',
     scrollbar_thumb = '#30231E',
     split = '#30231E',
     ansi = {
       '#1A1313', -- black
       '#B34750', -- red
       '#6B997B', -- green
       '#EBA123', -- yellow
       '#7A97CC', -- blue
       '#9E7ACC', -- magenta/purple
       '#4CD6D9', -- cyan/aqua
       '#E0DBC1', -- white
     },
     brights = {
       '#30231E', -- bright black
       '#D94B43', -- bright red
       '#77D989', -- bright green
       '#FFCA80', -- bright yellow
       '#61B8F2', -- bright blue
       '#CC6A84', -- bright magenta/purple
       '#8DCBCC', -- bright cyan/aqua
       '#FAF4DE', -- bright white
     },
   },
}

-- Set the color scheme
config.color_scheme = 'Automata Night'

return config
