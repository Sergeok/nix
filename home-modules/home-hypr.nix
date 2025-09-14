{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    mako
    waybar
    wofi
    grim
	slurp
  ];
}
