{config, lib, pkgs, ...}:{
  programs.tmux = {
   enable = true;
   mouse = true;
   keyMode = "vi";
   shortcut = "space";
   plugins = with pkgs;  [
     tmuxPlugins.yank
     tmuxPlugins.gruvbox
     tmuxPlugins.sensible
   ];
  };


}

