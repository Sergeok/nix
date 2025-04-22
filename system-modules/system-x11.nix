{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xrandr
  ];
  
  # Настройки X-сервера и дисплейного менеджера (через home-manager)
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = false;
        greeters.gtk.enable = false;
      };
    };
    windowManager.i3.enable = true;
	xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:alt_shift_toggle";
    };
  };
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.displayManager.defaultSession = "none+i3";
  
  services.xserver.videoDrivers = [ "modesetting" ]; # не нравится, что завязываемся на nvidia, вынести?
}
