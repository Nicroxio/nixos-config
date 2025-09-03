{ config, pkgs, ... }:

{
  imports = [
    ../../homeModules/programs/development/default.nix
  ];
  # target.genericLinux.enable = true; # ENABLE WHEN NOT NIXOS
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nic";
  home.homeDirectory = "/home/nic";
 
  home.stateVersion = "25.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.keepassxc
    pkgs.wget
    pkgs.alacritty
    pkgs.tmux
];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
 };

 home.sessionVariables = {
     EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
