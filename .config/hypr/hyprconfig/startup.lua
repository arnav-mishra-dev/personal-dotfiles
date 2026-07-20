-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("swaync")
  hl.exec_cmd("hyprpolkitagent")
  hl.exec_cmd("openrgb --startminimized --profile White")
  hl.exec_cmd("waybar & hyprpaper")
end)
