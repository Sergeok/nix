{ config, pkgs, ... }:

{
  # Настройки локализации
  i18n.defaultLocale = "en_US.UTF-8";

  # Настройка часового пояса
  time.timeZone = "Asia/Bangkok";

  # Раскладка клавиатуры в консоли
  console.keyMap = "us";

  # Настройки оборудования (Nvidia)
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
    };
  };
  
  # Поддержка камеры Logitech (Logitech C920/схожая)
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    ATTR{idVendor}=="046d", ATTR{idProduct}=="082d", GROUP="video", MODE="0660"
  '';

  # Автозапуск служб, D-Bus
  services.dbus.enable = true;
  programs.dconf.enable = true;
  
  # Настройки X-сервера и дисплейного менеджера (через home-manager)
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = false; # важно, чтобы не было конфликта с home-manager
	xkb = {
      layout = "us,ru";
      variant = ",";
      options = "grp:alt_shift_toggle";
    };
  };


  # Конфигурация Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };

  # Настройки безопасности и групп пользователей
  users.users.sergeok = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
  };

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
