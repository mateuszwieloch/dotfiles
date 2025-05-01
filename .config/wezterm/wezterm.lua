local wezterm = require("wezterm")
return {
  default_domain = "WSL:Debian",  -- launch WSL with Debian distro by default

  -- font = wezterm.font("FuraMono Nerd Font")

  -- disable ligatures
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"},

  keys = {
    {
      mods = "CTRL",
      key = "t",
      action = wezterm.action.SpawnTab("CurrentPaneDomain")
    },
    {
      mods = "CTRL",
      key = "w",
      action = wezterm.action.CloseCurrentTab({ confirm = false })
    },
    {
      mods = "CTRL",
      key = "h",
      action = wezterm.action.ActivateTabRelative(-1)
    },
    {
      mods = "CTRL",
      key = "l",
      action = wezterm.action.ActivateTabRelative(1)
    },
    {
      mods = "CTRL|SHIFT",
      key = "h",
      action = wezterm.action.MoveTabRelative(-1)
    },
    {
      mods = "CTRL|SHIFT",
      key = "l",
      action = wezterm.action.MoveTabRelative(1)
    },
    {
      mods = "CTRL",
      key = "v",
      action = wezterm.action.PasteFrom("Clipboard")
    },
  }
}
