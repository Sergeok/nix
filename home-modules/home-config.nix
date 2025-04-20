{ pkgs, ... }:

{
  # Шрифты и wallpaper
  home.file = {
    ".wallpaper/wallpaper.png".source = ../nord-dotfiles/assets/images/wallpaper.png;
    ".local/share/fonts".source = ../nord-dotfiles/assets/fonts;

    ".config/btop".source = ../nord-dotfiles/.config/btop;
    ".config/cava".source = ../nord-dotfiles/.config/cava;
    ".config/fastfetch".source = ../nord-dotfiles/.config/fastfetch;
    ".config/harlequin".source = ../nord-dotfiles/.config/harlequin;
    ".config/superfile".source = ../nord-dotfiles/.config/superfile;
    ".config/i3".source = ../nord-dotfiles/.config/i3;
    ".config/picom".source = ../nord-dotfiles/.config/picom;
    ".config/rofi".source = ../nord-dotfiles/.config/rofi;

    ".xbindkeysrc".text = ''
      "scrot ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
          Alt + Print

      "scrot -s ~/Pictures/screenshot-%Y-%m-%d_%H:%M:%S.png"
          Print
    '';
	
	".xsession" = {
	  text = ''
        exec ~/.hm-xsession
      '';
	  executable = true;
  };

  # i3 startup commands
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
	  package = pkgs.i3-gaps;
      config.startup = [
        { command = "feh --bg-fill ~/.wallpaper/wallpaper.png"; always = true; }
        { command = "dunst"; always = true; }
        { command = "picom --config ~/.config/picom/picom.conf"; always = true; }
        { command = "nm-applet"; always = true; }
        { command = "polybar main"; always = true; }
        { command = "xbindkeys"; always = true; }
      ];
    };
  };

  # Обновляем кеш шрифтов
  home.activation.fontCache = pkgs.lib.mkForce ''
    ${pkgs.fontconfig}/bin/fc-cache -fv
  '';
  
  programs.zsh = {
    enable = true;
#    oh-my-zsh.enable = true;
    shellAliases = {
      ll = "ls -l";
      gs = "git status";
    };
  };
}
