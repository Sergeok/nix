{ config, pkgs, ... }:

{
  services.xserver = {
    videoDrivers = [ "modesetting" ]; # можно "intel", но "modesetting" безопаснее и современнее
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
