{config, pkgs, lib,  ...}:{
  imports = [
  ./xserver.nix
  ./kde.nix
  ./cups.nix
  ./pipewire.nix
  ./ssh.nix
  ./syncthing.nix
  ]; 

  ssh.enable = 
    lib.mkDefault  false;

}
