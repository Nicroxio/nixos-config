# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/services/default.nix
      ];
  
  ## Setup Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  #Define Hostname
  networking.hostName = "nixos"; # Define your hostname.
  
  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

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

  #Enable Bluetooth
  hardware.bluetooth.enable = true;
 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nic = {
    isNormalUser = true;
    description = "Ferdinand";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };


 
## Install Global Packages ##
  # Install ZSH
  programs.zsh.enable = true;
  # Install firefox.
  programs.firefox.enable = true;
  # Allows things like Lazynvim to install its own packages
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
  wget
  alacritty
  tmux
  nerd-fonts.jetbrains-mono
 
 ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
