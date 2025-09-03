{ config, pkgs, ... }:

{
  imports = [
    ../../homeModules/default.nix
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

];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
 };

 home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
