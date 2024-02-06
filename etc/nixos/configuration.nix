{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./vm.nix
      ./other.nix
    ];
  
  
  # Change default config directory
  # https://nixos.wiki/wiki/NixOS_configuration_editors
  #
  # mkdir ~/etc
	# sudo mv /etc/nixos ~/etc/
	# sudo chown -R $(id -un):users ~/etc/nixos
	# sudo ln -s ~/etc/nixos /etc/
  
  
  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
  	enable = true;
  	devices = [ "nodev" ];
  	efiSupport = true;
  	useOSProber = true;
  	configurationLimit = 30;
  };
  
  # Enable BBR congestion control
  boot = {
  	kernelModules = [ "tcp_bbr" ];
  	kernel.sysctl = {
  		"net.ipv4.tcp_congestion_control" = "bbr";
  		"net.core.default_qdisc" = "fq";
  		};
  	};
  
  
  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  # networking.wireless.enable = true;
  
  
  # Nix Settings
  nix.settings = {
  	experimental-features = ["nix-command" "flakes"];
  	auto-optimise-store = true;
  	};
  
  
  # Set your time zone.
  time.timeZone = "Europe/Bucharest";
  
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };
  
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  
  
  # Enable CUPS to print documents.
  services.printing.enable = false;
  
  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  
  # Enable NTFS Support
  boot.supportedFilesystems = [ "ntfs" ];
  
  
  # Enable fish shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  
  
  # Enable flatpacks
  services.flatpak.enable = true;
  
  
  # Enable neovim
  programs.neovim = {
  	enable = true;
  	defaultEditor = true;
  	viAlias = true;
  	vimAlias = true;
  };
  
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.blackwew = {
    isNormalUser = true;
    description = "blackwew";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
  
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Idk what depends on this. Maybe discord?
  nixpkgs.config.permittedInsecurePackages = [
  	"electron-24.8.6"
  ];
  
  # Installed packages:
  environment.systemPackages = with pkgs; [
      home-manager
      firefox
      alacritty
      neofetch
      htop
      git
      nerdfonts
  ];
  
  
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
  
  
  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };
  
  
  # System version
  system.stateVersion = "23.11";
  
  
  # Automatic system updates
  system.autoUpgrade.enable = false;
  
  
  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };

}
