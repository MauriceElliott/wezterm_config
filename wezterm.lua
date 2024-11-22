  -- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local is_macos = wezterm.target_triple:find("darwin") ~= nil

if is_macos == false then
    config.default_prog = { 'ubuntu' }
end
-- This will hold the configuration.
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- This is where you actually apply your config choice
config.font_size = 14.5
-- config.font = wezterm.font 'CaskaydiaCove Nerd Font'
config.font = wezterm.font 'DepartureMono Nerd Font'
-- For example, changing the color scheme:
-- config.color_scheme = 'kanagawabones'

config.colors = {
  foreground = '#DAE3EB',
  background = '#261510',
  cursor_bg = '#DAE3EB',
  cursor_fg = '#0F2733',
  cursor_border = '#DAE3EB',
  selection_fg = '#DAE3EB',
  selection_bg = '#9AA0A6',
  scrollbar_thumb = '#9AA0A6',
  split = '#7D4433',
  ansi = {
    '#0F2733', -- Darkest from GW
    '#7D4433',  -- Darkened GW 
    '#5F9E89', -- custom for this
    '#598046', -- Darkened version of light green
    '#204254', -- Lighter Dark from GW
    '#73456B', -- Purple from GW
    '#507273', -- Custom Teal
    '#DAE3EB', -- GW White
  },
  brights = {
    '#9AA0A6', -- darkened GW White
    '#997154', -- red from GW
    '#9DC489', -- light green from GW
    '#DAED61', -- GW Yellow Highlight
    '#74B0CF', -- GW Blue Highlight
    '#B881AE', -- GW Purple, light and desaturated.
    '#53B5E6', -- GW Blue Highlight, but lighter and higher saturation
    '#E1F0F2', -- brighter GW white
  },
  compose_cursor = '#CC6114',
  copy_mode_active_highlight_bg = { Color = '#E1F0F2' },
  copy_mode_active_highlight_fg = { Color = '#0F2733' },
  copy_mode_inactive_highlight_bg = { Color = '#7D4433' },
  copy_mode_inactive_highlight_fg = { Color = '#DAE3EB' },
  quick_select_label_fg = { Color = '#E1F0F2' },
  quick_select_match_bg = { Color = '#204254' },
  quick_select_match_fg = { Color = '#E1F0F2' },
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
}

return config
