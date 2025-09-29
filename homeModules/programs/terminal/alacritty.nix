{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    alacritty.enable = lib.mkEnableOption "Enable Alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      theme = "catppuccin_mocha";
    };
  };
}
