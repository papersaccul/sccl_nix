{
  description = "sacculos NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-25.11";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

outputs = { self, nixpkgs, nixpkgs-unstable, disko, home-manager, stylix, ... }@inputs:
let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
  };

  pkgs-unstable = import nixpkgs-unstable {
    inherit system;
  };
in {
  nixosConfigurations = {
    sacculos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs pkgs-unstable;
      };

      modules = [
        ./hosts/sacculos/configuration.nix
        ./hosts/sacculos/disko.nix
        ./nixos/modules/zapret.nix
        stylix.nixosModules.stylix
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.paper = import ./home-manager/home.nix;

            extraSpecialArgs = {
              inherit inputs pkgs-unstable;
            };
          };
        }
      ];
    };
  };
};
}
