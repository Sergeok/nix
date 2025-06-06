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
  ];
}
