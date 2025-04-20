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

    # Rice (персонализация окружения)
    kitty
    feh
    rofi
    picom
    dunst
    polybar
    i3-gaps

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
