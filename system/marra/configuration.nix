{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/remove-gnome-bloat.nix
      
    ];
  
  
  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
  	enable = true;
  	devices = [ "nodev" ];
  	efiSupport = true;
  	useOSProber = true;
  	configurationLimit = 30;
  };

  # Latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # TLP Power Management
  services.power-profiles-daemon.enable = false;
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 40;

       # Optional helps save long term battery health
       # START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       	STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
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
  networking.hostName = "marra";
  # networking.wireless.enable = true;
  
  
  # Nix Settings
  nix.settings = {
  	experimental-features = ["nix-command" "flakes"];
  	auto-optimise-store = true;
  	};
  
  
  # Set time zone
  time.timeZone = "Europe/Bucharest";
  
  
  # Select internationalisation properties
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
  
  
  # Enable the X11
  services.xserver.enable = true;
  
  
  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  
  # CUPS for printing documents
  services.printing.enable = false;
  
  
  # Enable sound with pipewire
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
  
  
  # Define a user account !! Don't forget to set a password with "passwd"!!
  users.users.marra = {
    isNormalUser = true;
    description = "Work Computer";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
  
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  
  # Installed packages:
  environment.systemPackages = with pkgs; [
      firefox
      alacritty
      htop
      git
      nerdfonts
  ];
  
  
  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };
  
  
  # System version
  system.stateVersion = "24.05";
  
  
  # Automatic system updates
  system.autoUpgrade.enable = false;
  
  
  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };

}
