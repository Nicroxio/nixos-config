{config, pkgs, lib, ...}:{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./alacritty.nix
  ];


alacritty.enable = lib.mkDefault true;
tmux.enable = lib.mkDefault true;
zsh.enable = lib.mkDefault true;
}
