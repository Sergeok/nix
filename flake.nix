{
  description = "Nord-themed dotfiles using Home Manager and Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      theme = "nord";
	in {
      nixosConfigurations = {
        sergeok = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
		  pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
          modules = [
            ./system-modules/system-config.nix
            ./system-modules/system-packages.nix
            ./system-modules/boot.nix
            ./system-modules/system-x11.nix

		    ./hardware-modules/hardware-sergeok.nix
			
			# X11 + NVIDIA
		    #./hardware-modules/nvidia.nix
		    #./system-modules/system-x11-nvidia.nix
			
			# X11 + AMD
			./system-modules/system-x11-amd.nix
          ];
        };
      };

      homeConfigurations = {
        sergeok = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
          modules = [
            ./home-modules/home.nix
            ./home-modules/home-packages.nix
            ./home-modules/home-x11.nix
			
            ./home-modules/theme/${theme}/theme.nix
            ./home-modules/theme/${theme}/theme-x11.nix
          ];
        };
      };
    };
}
