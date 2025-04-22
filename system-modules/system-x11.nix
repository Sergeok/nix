{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    i3-gaps
    xorg.xrandr
  ];
  
  # Настройки X-сервера и дисплейного менеджера (через home-manager)
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        greeters.gtk.enable = true;
      };

      sessionPackages = [
        (pkgs.i3-gaps.overrideAttrs (old: {
          passthru.providedSessions = [ "i3" ];
        }))
      ];
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
