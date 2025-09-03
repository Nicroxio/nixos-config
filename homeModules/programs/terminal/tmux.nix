{config, lib, pkgs, ...}:{
options = {
  tmux.enable = lib.mkEnableOption "enables tmux";
};
config = lib.mkIf config.tmux.enable{
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
 };

}

