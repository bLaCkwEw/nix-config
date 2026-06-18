{
  description = "NixOS and Home Manager configuration for blackwew";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      homeConfigurations."blackwew" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];
      };

      homeConfigurations."gabriel" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./user-gabriel.nix
        ];
      };

      nixosConfigurations.tina = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./system/tina/configuration.nix
        ];
      };
    };
}
