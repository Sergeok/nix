{ pkgs, ... }:

{
  # =========================
  # Kitty Terminal
  # =========================
  home.file.".config/kitty".source = ../nord-dotfiles/.config/kitty;

  # =========================
  # Polybar
  # =========================
  home.file.".config/polybar".source = ../nord-dotfiles/.config/polybar;

  # =========================
  # Starship Prompt
  # =========================
  programs.starship = {
    enable = true;
    settings = {}; # Можно заменить на inline конфиг или файл
  };

  home.file.".config/starship.toml".source = ../nord-dotfiles/.config/starship.toml;

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
    ../nord-dotfiles/.config/nord.zsh-theme;
}
