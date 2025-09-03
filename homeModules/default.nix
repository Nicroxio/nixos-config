{config, pkgs, lib, ...}:{
  imports = [
    ./programs/development/default.nix
    ./programs/terminal/default.nix
  ];

}
