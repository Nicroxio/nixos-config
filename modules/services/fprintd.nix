{ lib, config, ... }:
{
  options.fingerprint.enable = lib.mkEnableOption "Enable FprintD";

  config = lib.mkIf config.fingerprint.enable {
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
    };
    services.fprintd.enable = true;
  };
}
