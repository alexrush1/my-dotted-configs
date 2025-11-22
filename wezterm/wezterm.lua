local wezterm = require 'wezterm'
local appearance = require 'appearance'

local config = wezterm.config_builder()

-- Terminal Font
config.font_size = 15.0;
config.enable_tab_bar = true;
config.font = wezterm.font('JetBrains Mono', { weight = "Bold"})

-- Window Opacity
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_decorations = 'RESIZE'
config.default_cursor_style = "BlinkingBar"

if appearance.is_dark() then
  config.color_scheme = 'Nord (Gogh)'
else
  config.color_scheme = 'Tokyo Night Day'
end

-- Bind for Multi-Terminal mode
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '"',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

-- Window Top Bar
config.window_frame = {
  font = wezterm.font({ family = 'JetBrains Mono', weight = 'Bold' }),
  font_size = 15.0,
  active_titlebar_bg = '#333333',
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = '#575757',
  },
}

-- PLUGINS --

-------- Bar Plugin --------
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
----------------------------

return config
