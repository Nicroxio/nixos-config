{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.xserv.enable = lib.mkEnableOption "Enable Xserver";

  config = lib.mkIf config.xserv.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "us";
    };
  };
}
