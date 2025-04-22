{ pkgs, ... }:

{
  home.file = {
    # Шрифты и wallpaper
    ".wallpaper/wallpaper.png".source = ../nord-dotfiles/assets/images/wallpaper.png;
    ".local/share/fonts".source = ../nord-dotfiles/assets/fonts;

    ".config/btop".source = /etc/nixos/nord-dotfiles/.config/btop;
    ".config/cava".source = /etc/nixos/nord-dotfiles/.config/cava;
    ".config/fastfetch".source = /etc/nixos/nord-dotfiles/.config/fastfetch;
    ".config/harlequin".source = /etc/nixos/nord-dotfiles/.config/harlequin;
    ".config/superfile".source = /etc/nixos/nord-dotfiles/.config/superfile;
  };
  
  # Обновляем кеш шрифтов
  home.activation.fontCache = pkgs.lib.mkForce ''
    ${pkgs.fontconfig}/bin/fc-cache -fv
  '';

  # =========================
  # Kitty Terminal
  # =========================
  home.file.".config/kitty".source = ../nord-dotfiles/.config/kitty;

  # =========================
  # Starship Prompt
  # =========================
  programs.starship = {
    enable = true;
    settings = {}; # Можно заменить на inline конфиг или файл
  };
  home.file.".config/starship.toml".source = /etc/nixos/nord-dotfiles/.config/starship.toml;

  # =========================
  # Zsh + Oh-My-Zsh + Nord Theme
  # =========================
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "nord-deep/nord";
      custom = "$HOME/.oh-my-zsh/custom";
    };
    shellAliases = {
      pipesh = "pipes.sh -p 5 -c 4 -f 100";
      clock = "tty-clock -c -C 6";
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
  home.file.".oh-my-zsh/custom/themes/nord-deep/nord.zsh-theme".source =
    /etc/nixos/nord-dotfiles/.config/nord.zsh-theme;
}
