{ config, lib, pkgs, ... }:

{
	# Remove gnome packages
	environment.gnome.excludePackages = (with pkgs; [
		gnome-tour 
		geary # mail client
		epiphany # web browser
		totem # video player
		gnome-music # music player
	]);


	# Disable xterm
	services.xserver.excludePackages = [ pkgs.xterm ];
}
