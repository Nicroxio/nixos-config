{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    git.enable = lib.mkEnableOption "enables git.nix";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings.user.name = "Nicroxio";
      settings.user.email = "Ferdi@nicroxio.co.uk";
      lfs.enable = true;
    };
  };

}
