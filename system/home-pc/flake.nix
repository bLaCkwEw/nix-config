{
  description = "Home PC - System Config";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11"; };

  outputs = { self, nixpkgs, ... }:
    let lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };
    };
}
