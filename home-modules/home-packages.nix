{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xbindkeys
  
    # GUI-приложения и утилиты
    firefox
    chromium
    vlc
    libreoffice-still
    notepadqq
    lite-xl
    filezilla
    harlequin

    # Rice (персонализация окружения)
    kitty
    feh
    rofi
    picom
    dunst
    polybar

    # Терминальные утилиты и украшения
    fastfetch
    cava
    scrot
    pipes
    tty-clock

    # Файловые менеджеры и утилиты
    yazi
    superfile
    exiftool
  ];
}
