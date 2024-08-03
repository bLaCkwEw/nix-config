{ config, pkgs, ... }:

{
	fileSystems."/mnt/media-backup" = {
		device = "/dev/disk/by-uuid/1A4E5FD27E2A307E";
		fsType = "ntfs";
	};
}
