{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mesa
    libva
    libvdpau-va-gl
    vaapiVdpau
    vulkan-loader
    vulkan-tools
  ];
  
  services.xserver = {
    videoDrivers = [ "amdgpu" ];
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
