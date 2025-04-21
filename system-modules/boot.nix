{ config, pkgs, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev";  # если UEFI
    efiSupport = true;
    useOSProber = true;
  };
  boot.loaderefi.efiSysMountPoint = "/boot";
}