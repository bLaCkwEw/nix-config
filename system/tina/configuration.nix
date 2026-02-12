{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # ./modules/vm.nix

    ./modules/remove-gnome-bloat.nix

    ./modules/nvidia.nix
  ];

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    devices = ["nodev"];
    efiSupport = true;
    useOSProber = true;
    configurationLimit = 30;
  };

  # Enable Steam
  programs.steam = {
    enable = true;
    extest.enable = true;
  };

  # Try to make controller work consistently
  hardware.steam-hardware.enable = true;
  hardware.xpadneo.enable = true;
  # hardware.xone.enable = true;

  # Swap file
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  # Latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable BBR congestion control
  boot = {
    kernelModules = ["tcp_bbr"];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
    };
  };

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "tina";
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
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # CUPS for printing documents
  services.printing.enable = false;

  # Enable sound with pipewire
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    audio.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable NTFS Support
  boot.supportedFilesystems = ["ntfs"];

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

  # Enable tailscale
  # services.tailscale.enable = true;

  # Enable support for dynamically linked binaries
  programs.nix-ld = {
    enable = true;
  };

  # Define a user account !! Don't forget to set a password with "passwd"!!
  users.users.blackwew = {
    isNormalUser = true;
    description = "blackwew";
    extraGroups = ["networkmanager" "wheel" "audio" "input"];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installed packages:
  environment.systemPackages = with pkgs; [
    firefox
    alacritty
    fastfetch
    htop
    git
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig.useEmbeddedBitmaps = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };

  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # System version
  system.stateVersion = "24.11";

  # Automatic system updates
  system.autoUpgrade.enable = false;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };
}
