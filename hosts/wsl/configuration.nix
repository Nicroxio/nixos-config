# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/default.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  #Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  #Define Hostname
  networking.hostName = "wsl"; # Define your hostname.

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nic = {
    isNormalUser = true;
    description = "Ferdinand";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  home-manager.users.nic = {
    # Import your home.nix or define your configuration here
    # For example, with a separate home.nix file:
    imports = [ (import ./home.nix) ];
  };

  ### WSL Specific ###
  ssh.enable = false;
  kde.enable = false;
  audio.enable = false;
  xserv.enable = false;
  sync.enable = false;
  fingerprint.enable = false;

  ####################

  ## Install Global Packages ##
  # Install firefox.
  programs.firefox.enable = true;
  # Allows things like Lazynvim to install its own packages
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    wget
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";

}
