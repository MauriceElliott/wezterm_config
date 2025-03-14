  -- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local is_macos = wezterm.target_triple:find("darwin") ~= nil

if is_macos == false then
  config.wsl_domains = {
    {
      -- The name of this specific domain.  Must be unique amonst all types
      -- of domain in the configuration file.
      name = 'WSL',
  
      -- The name of the distribution.  This identifies the WSL distribution.
      -- It must match a valid distribution from your `wsl -l -v` output in
      -- order for the domain to be useful.
      distribution = 'void',
    },
  }
  config.default_prog = { 'wsl' }
  config.font_size = 13
else
  config.macos_window_background_blur = 10
  config.font_size = 14
end

config.window_background_opacity = 80
-- config.font = wezterm.font('Dank Mono', { weight = 'Bold', italic = false })
config.font = wezterm.font('Cascadia Code')
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

-- config.window_background_opacity = 0.95
-- config.font = wezterm.font('Dank Mono', { weight = 'Bold', italic = false })
-- config.colors = {
--   foreground = '#2B2A2A',
--   background = '#DAD4BA',
--   cursor_bg = '#2B2A2A',
--   cursor_fg = '#EBE6D2',
--   cursor_border = '#DAE3EB',
--   selection_fg = '#DAE3EB',
--   selection_bg = '#0F2733',
--   scrollbar_thumb = '#080703',
--   split = '#C0BCAC',
--   ansi = {
--     '#2B2A2A', -- Black
--     '#662A37', -- Red
--     '#244E33', -- Green
--     '#B67F21', -- Yellow
--     '#3A4A67', -- Blue
--     '#674C8B', -- Purple
--     '#457A7A', -- Cyan
--     '#C0BCAC', -- White
--   },
--   brights = {
--     '#402F27', -- Light Black
--     '#992C34', -- Light Red
--     '#416647', -- light Green
--     '#ADAD39', -- Light Yellow
--     '#5B89A7', -- Light Blue
--     '#954C5F', -- Light Purple
--     '#328E8F', -- Light Cyan
--     '#EBE6D2', -- Light White
--   },
--   compose_cursor = '#2B2A2A',
--   copy_mode_active_highlight_bg = { Color = '#2B2A2A' },
--   copy_mode_active_highlight_fg = { Color = '#0F2733' },
--   copy_mode_inactive_highlight_bg = { Color = '#EBE6D2' },
--   copy_mode_inactive_highlight_fg = { Color = '#1B465C' },
--   quick_select_label_fg = { Color = '#2B2A2A' },
--   quick_select_label_bg = { Color = '#EBE6D2' },
--   quick_select_match_bg = { Color = '#EBE6D2' },
--   quick_select_match_fg = { Color = '#2B2A2A' },
-- }

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
    key = ':',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      command = { args = { 'pwsh' } },
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
