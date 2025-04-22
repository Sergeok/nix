{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xbindkeys
    feh
    picom
    dunst
    polybar
    rofi
    scrot
  ];

  home.file.".xbindkeysrc".text = ''
    "scrot ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
        Alt + Print

    "scrot -s ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
        Print
  '';

  home.file.".xinitrc".text = ''
    exec i3
  '';

  xdg.configFile."i3/config".text = ''
    exec --no-startup-id feh --bg-fill ~/.wallpaper/wallpaper.png
    exec --no-startup-id dunst
    exec --no-startup-id picom --config ~/.config/picom/picom.conf
    exec --no-startup-id polybar main
    exec --no-startup-id xbindkeys
  '';
}
