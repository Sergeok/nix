{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xrandr
  ];
  
  # Настройки X-сервера и дисплейного менеджера (через home-manager)
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "none+i3";
    windowManager.i3.enable = false; # важно, чтобы не было конфликта с home-manager
	xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:alt_shift_toggle";
    };
  };
}
