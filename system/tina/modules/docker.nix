{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable docker
  virtualisation.docker.enable = true;
  users.users.blackwew.extraGroups = ["docker"];

  # Install lazydocker for easier management
  environment.systemPackages = with pkgs; [
    lazydocker
  ];
}
