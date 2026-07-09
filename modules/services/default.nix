{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./xserver.nix # xserv
    ./kde.nix # kde
    ./pipewire.nix # Audio
    ./ssh.nix # ssh
    ./syncthing.nix # sync
    ./fprintd.nix # fingerprint
  ];

  ssh.enable = lib.mkDefault false;
  kde.enable = lib.mkDefault true;
  audio.enable = lib.mkDefault true;
  xserv.enable = lib.mkDefault true;
  sync.enable = lib.mkDefault true;
  fingerprint.enable = lib.mkDefault false;

}
