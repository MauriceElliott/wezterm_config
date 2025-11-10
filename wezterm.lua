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
  ['Automata'] = {
    -- The default text color
    foreground = '#1F1E1E',
    -- The default background color
    background = '#DAD4BA',

    -- Overrides the cell background color when the current cell is occupied by the cursor
    cursor_bg = '#33251F',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = '#DAD4BA',
    -- Specifies the border color of the cursor
    cursor_border = '#33251F',

    -- The foreground color of selected text
    selection_fg = '#1F1E1E',
    -- The background color of selected text
    selection_bg = '#EBE6D2',

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = '#918E82',

    -- The color of the split lines between panes
    split = '#918E82',

    -- ANSI color palette (standard colors)
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

    -- Bright ANSI colors
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
}

-- Set the color scheme
config.color_scheme = 'Automata'

return config
