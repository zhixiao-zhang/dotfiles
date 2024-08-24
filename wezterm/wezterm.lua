local wezterm = require 'wezterm';
local config = wezterm.config_builder()

config.font = wezterm.font({family="ComicShannsMono Nerd Font"})
config.font_rules = {
  {
    intensity = "Bold",
    font = wezterm.font("ComicShannsMono Nerd Font", {weight="Bold", stretch="Normal", style="Normal"}),
  },
  {
    italic = true,
    font = wezterm.font("ComicShannsMono Nerd Font", {weight="Regular", stretch="Normal", style="Italic"}),
  },
  {
    italic = true,
    intensity = "Bold",
    font = wezterm.font("ComicShannsMono Nerd Font", {weight="Bold", stretch="Normal", style="Italic"}),
  },
}
config.color_scheme = "Catppuccin Latte"

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  config.font_size = 16.0
  config.enable_wayland = true
else
  config.font_size = 20.0
  -- config.macos_window_background_blur = 20
end 

config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.8

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
