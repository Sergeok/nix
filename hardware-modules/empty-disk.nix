{ lib, config, ... }:

let
  emptyDisk = builtins.getEnv "EMPTY_DISK";

in
assert emptyDisk != "";

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
              size = "45%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
			home = {
              size = "90%";
              content = {
                type = "filesystem";
				format = "ext4";
                mountpoint = "/home";
              };
            };
          };
        };
      };
    };
  };
}
