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

  home.file.".xinitrc".text = ''
    exec i3
  '';
}
