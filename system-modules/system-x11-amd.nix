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

    deviceSection = ''
      Section "Device"
        Identifier "AMD"
        Driver "amdgpu"
        Option "TearFree" "true"
      EndSection
    '';
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
