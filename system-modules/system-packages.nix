{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    zsh
	xorg.xinit
  
    # Управление системой и правами
    sudo

    # Docker и контейнеры
    docker
    docker-compose
	lazydocker

    # Утилиты для работы с оборудованием и системой
    nvidia-settings
    smartmontools    # предоставляет smartctl (диагностика дисков)
    networkmanagerapplet   # управление сетями на системном уровне (Wi-Fi GUI)

    # CLI-инструменты, которые могут использоваться системными скриптами
    git
    curl
    wget
    unzip
    fd
    tree
    glxinfo
    xrandr
    wl-clipboard

    # Мониторинг и диагностика на системном уровне
    btop
    ctop

    # VPN и Proxy (лучше иметь на системном уровне)
    openconnect
    proxychains-ng

    # Удалённый доступ
    freerdp
    putty

    # Поддержка Android-приложений на уровне контейнеров
    waydroid
  ];

  # Flatpak конфигурация
  services.flatpak.enable = true;

  # Flatpak приложения
  services.flatpak.packages = [
    # Список Flatpak приложений (пока пусто)
  ];

  # Flatpak Overrides (переопределения)
  services.flatpak.overrides = {
    # Настройки переопределений Flatpak (пока пусто)
  };
}
