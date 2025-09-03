{config, lib, pkgs, ...}:{
options = {
  zsh.enable = lib.mkEnableOption "enables zsh";
};

config = lib.mkIf config.git.enable{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;
    prezto = {
      enable = true;
      tmux.autoStartLocal = true;
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
    initContent = "source ~/.p10k.zsh";


  };
  };

}
