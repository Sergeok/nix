{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";
  
  home.username = "sergeok";
  home.homeDirectory = "/home/sergeok";

  programs.home-manager.enable = true;
}
