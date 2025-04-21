{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
	xbindkeys
	feh
	picom
    dunst
    polybar
	rofi
  ];

  home.file = {
    ".xbindkeysrc".text = ''
      "scrot ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
          Alt + Print

      "scrot -s ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
          Print
    '';

	".xsession" = {
	  text = ''
        exec ~/.hm-xsession
      '';
	  executable = true;
    };
  };
  
  # i3 startup commands
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config.startup = [
        { command = "feh --bg-fill ~/.wallpaper/wallpaper.png"; always = true; }
        { command = "dunst"; always = true; }
        { command = "picom --config ~/.config/picom/picom.conf"; always = true; }
        { command = "nm-applet"; always = true; }
        { command = "polybar main"; always = true; }
        { command = "xbindkeys"; always = true; }
      ];
    };
  };
}
