{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI-приложения и утилиты
    firefox
    chromium
    vlc
    libreoffice-still
    notepadqq
    lite-xl
    filezilla
    harlequin
    clementine

    # Rice (персонализация окружения)
    kitty

    # Терминальные утилиты и украшения
    fastfetch
    cava
    pipes
    tty-clock

    # Файловые менеджеры и утилиты
    yazi
    superfile
    exiftool
    
    # Flatpak
    flatpak
  ];
  
  # Установить flatpak-пакеты декларативно (неофициальный способ)
  home.activation.flatpakApps = lib.hm.dag.entryAfter ["writeBoundary"] ''
    flatpak install -y --noninteractive flathub com.bitwarden.desktop
    flatpak install -y --noninteractive flathub org.telegram.desktop
    flatpak install -y --noninteractive flathub org.kde.krita
    flatpak install -y --noninteractive flathub com.obsproject.Studio
    flatpak install -y --noninteractive flathub com.discordapp.Discord
    flatpak install -y --noninteractive flathub com.clockify.Clockify
    flatpak install -y --noninteractive flathub net.xmind.XMind
    flatpak install -y --noninteractive flathub com.getpostman.Postman
    flatpak install -y --noninteractive flathub rest.insomnia.Insomnia
    flatpak install -y --noninteractive flathub com.jetbrains.IntelliJ-IDEA-Ultimate
    flatpak install -y --noninteractive flathub net.ankiweb.Anki
    flatpak install -y --noninteractive flathub io.anytype.anytype
  '';

  # Устанавливаем права доступа для Flatpak-приложений
  home.activation.flatpakOverrides = lib.hm.dag.entryAfter ["flatpakApps"] ''
    # Postman — только Downloads
    flatpak override --nofilesystem=home \
      --filesystem=xdg-Downloads \
      com.getpostman.Postman

    # Insomnia — Downloads + Documents
    flatpak override --nofilesystem=home \
      --filesystem=xdg-Downloads \
      --filesystem=xdg-Documents \
      rest.insomnia.Insomnia

    # Discord — разрешим доступ к Pictures (если ты делишься скриншотами)
    flatpak override --nofilesystem=home \
      --filesystem=xdg-Pictures \
      com.discordapp.Discord

    # OBS Studio — доступ к Videos (для записи), без доступа ко всему home
    flatpak override --nofilesystem=home \
      --filesystem=xdg-Videos \
      com.obsproject.Studio

    # XMind — доступ к Documents
    flatpak override --nofilesystem=home \
      --filesystem=xdg-Documents \
      net.xmind.XMind
  '';
}
