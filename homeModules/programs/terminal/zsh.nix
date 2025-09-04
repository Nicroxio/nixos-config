{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.git.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 1000;
      zplug = {
        enable = true;
        plugins = [
          {
            name = "romkatv/powerlevel10k";
            tags = [
              "as:theme"
              "depth:1"
            ];
          }
        ];
      };
      initContent =
        let
          zshConfigEarlyInit = lib.mkOrder 500 ''if [ "$TMUX" = "" ]; then tmux; fi'';
          zshConfig = lib.mkOrder 1000 "source ~/.p10k.zsh";
        in
        lib.mkMerge [
          zshConfigEarlyInit
          zshConfig
        ];

      ### Shell Alias ###
      shellAliases = {
        gp = "git push";
        ga = "git add -A";
        update = "nix flake update --flake ~/nixos-config  && sudo nixos-rebuild switch --flake ~/nixos-config#";
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#";
        collect = "sudo nix-collect-garbage -d";
      };

    };
  };

}
