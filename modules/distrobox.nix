{ ... }:

{
 # Distrobox
 programs.distrobox = {
    enable = true;
    containers = {
      # arch_linux = {
        # image = "archlinux:latest";
        # additional_packages = ""; # List of packages to install on the system
        # exported_bins = ""; # Binaries
        # exported_apps = ""; # Binaries with desktop entries
      # };
      # ubuntu = {
        # image = "ubuntu:24.04";
        # additional_packages = ""; # List of packages to install on the system
        # exported_bins = ""; # Binaries
        # exported_apps = ""; # Binaries with desktop entries
      # };
    };
  };

  # Podman
  services.podman = {
    enable = true;
  };
}
