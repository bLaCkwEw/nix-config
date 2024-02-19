{ config, lib, pkgs, ... }:

{
	# Remove gnome packages
  environment.gnome.excludePackages = (with pkgs; [
  gnome-tour
  ]) ++ (with pkgs.gnome; [
  gnome-music # music player
  geary # mail client
  epiphany # web browser
  totem # video player
  ]);
  
  
  # Disable xterm
  services.xserver.excludePackages = [ pkgs.xterm ];
}
