{ lib, config, ... }:

let
  emptyDisk = builtins.getEnv "EMPTY_DISK";
  homeDisk = builtins.getEnv "HOME_DISK";

in
assert emptyDisk != "" && homeDisk != "";

{
  disko.devices = {
    disk = {
      system = {
        device = emptyDisk;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "95%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };

      data = {
        device = homeDisk;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            home = {
              size = "95%";
              content = {
                type = "mount";
                mountpoint = "/home";
              };
            };
          };
        };
      };
    };
  };
}
