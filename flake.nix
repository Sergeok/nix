{
  description = "Nord-themed dotfiles using Home Manager and Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      sergeok = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system-modules/system-config.nix
          ./system-modules/system-packages.nix
        ];
      };
    };

    homeConfigurations = {
      sergeok = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        modules = [
          ./home.nix
          ./home-modules/theme.nix
          ./home-modules/home-config.nix
          ./home-modules/home-packages.nix
        ];
      };
    };
  };
}
