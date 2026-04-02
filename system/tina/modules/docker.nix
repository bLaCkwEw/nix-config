{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;
  users.users.blackwew.extraGroups = ["docker"];
}
