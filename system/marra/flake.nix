{
  description = "Marra - Work Computer - System Config";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05"; };

  outputs = { self, nixpkgs, ... }:
    let lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
       marra = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };
    };
}
