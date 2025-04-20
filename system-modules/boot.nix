boot.loader = {
  grub.enable = true;
  grub.device = "nodev";  # если UEFI
  grub.efiSupport = true;
  efi.supported = true;
  efi.efiSysMountPoint = "/boot";
  grub.useOSProber = true;
};
