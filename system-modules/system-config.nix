{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";

  # Настройки локализации
  i18n.defaultLocale = "en_US.UTF-8";

  # Настройка часового пояса
  time.timeZone = "Asia/Bangkok";

  # Раскладка клавиатуры в консоли
  console.keyMap = "us";

  # Поддержка камеры Logitech (Logitech C920/схожая)
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    ATTR{idVendor}=="046d", ATTR{idProduct}=="082d", GROUP="video", MODE="0660"
  '';

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

  # Flatpak конфигурация
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = "gtk";
      };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # ZSH конфигурация
  programs.zsh = {
    enable = true;
#    oh-my-zsh.enable = true;
    shellAliases = {
      ll = "ls -l";
      gs = "git status";
    };
  };

  # Настройки безопасности и групп пользователей
  users.users.sergeok = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "docker" ];
    shell = pkgs.zsh;
	initialPassword = "sergeok";
  };
  security.sudo.wheelNeedsPassword = false;

  # Автозапуск служб
  programs.dconf.enable = true;
  security.sudo.enable = true;
  security.polkit.enable = true;
  services.dbus.enable = true;
}