{ config, pkgs, lib, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;                   # для лучшей совместимости с X
    open = false;                                # закрытый драйвер
    nvidiaSettings = true;                       # утилита nvidia-settings
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  environment.systemPackages = [
    config.boot.kernelPackages.nvidiaPackages.latest.settings
  ];

  # Специально отключаем модули для встроенной графики
  boot.blacklistedKernelModules = [ "i915" ];
}
#  mkDriver {
#    version = "570.133.07";
#    sha256_64bit = "sha256-LUPmTFgb5e9VTemIixqpADfvbUX1QoTT2dztwI3E3CY=";
#    sha256_aarch64 = "sha256-yTovUno/1TkakemRlNpNB91U+V04ACTMwPEhDok7jI0=";
#    openSha256 = "sha256-9l8N83Spj0MccA8+8R1uqiXBS0Ag4JrLPjrU3TaXHnM=";
#    settingsSha256 = "sha256-XMk+FvTlGpMquM8aE8kgYK2PIEszUZD2+Zmj2OpYrzU=";
#    persistencedSha256 = "sha256-G1V7JtHQbfnSRfVjz/LE2fYTlh9okpCbE4dfX9oYSg8=";
#
#    patches = [ rcu_patch ];
# };