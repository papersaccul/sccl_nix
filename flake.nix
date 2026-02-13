{
  description = "sacculos NixOS configuration";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-25.11";

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";

  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations = {
      sacculos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
            ./hosts/sacculos/configuration.nix
            ./nixos/modules/zapret.nix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
                home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.paper = import ./home-manager/home.nix;
                extraSpecialArgs = { inherit inputs; };
                };
            }
        ];
      };
    };
  };
}
