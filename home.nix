{ config, pkgs, ... }:

{
  home.username = "sergeok";
  home.homeDirectory = "/home/sergeok";

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
