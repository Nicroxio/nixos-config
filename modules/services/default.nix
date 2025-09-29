{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./xserver.nix
    ./kde.nix
    ./cups.nix
    ./pipewire.nix
    ./ssh.nix
    ./syncthing.nix
    ./fprintd.nix
  ];

  ssh.enable = lib.mkDefault false;

}
