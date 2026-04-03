{
  description = "NixOS and Home Manager configuration for blackwew";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    homeConfigurations."blackwew" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        nvf.homeManagerModules.default
        ./home.nix
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
