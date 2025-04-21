{ pkgs, ... }:

{
  home.file = {
    ".config/i3".source = ../nord-dotfiles/.config/i3;
    ".config/picom".source = ../nord-dotfiles/.config/picom;
    ".config/rofi".source = ../nord-dotfiles/.config/rofi;
  };

  # =========================
  # Polybar
  # =========================
  home.file.".config/polybar".source = ../nord-dotfiles/.config/polybar;
}
