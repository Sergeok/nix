{ config, pkgs, ... }:

{
  services.flatpak.packages = [
    "com.bitwarden.desktop"
	"org.telegram.desktop"
	"org.kde.krita"
	"com.obsproject.Studio"
	"com.discordapp.Discord"
	"com.clockify.Clockify"
	"net.xmind.XMind"
	"com.getpostman.Postman"
	"rest.insomnia.Insomnia"
	"com.jetbrains.IntelliJ-IDEA-Ultimate"
	"net.ankiweb.Anki"
	"io.anytype.anytype"
  ];
}