{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    config.boot.kernelPackages.nvidiaPackages.latest.settings
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  
  # Включаем полную компоновку (устранение tearing)
  environment.etc."X11/xorg.conf.d/10-nvidia.conf".text = ''
    Section "Screen"
      Identifier "Screen0"
      Option "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
    EndSection
  '';
}
