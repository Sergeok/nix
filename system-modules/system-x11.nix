{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    i3-gaps
    xorg.xrandr
  ];
  
  # Настройки X-сервера и дисплейного менеджера (через home-manager)
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "none+i3";
    windowManager.i3.enable = true;
	xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:alt_shift_toggle";
    };
  };
  
  services.xserver.videoDrivers = [ "nvidia" ]; # не нравится, что завязываемся на nvidia, вынести?
}
