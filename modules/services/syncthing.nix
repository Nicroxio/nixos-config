{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.sync.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf config.sync.enable {
    services.syncthing = {
      enable = true;
      group = "users";
      user = "nic";
      dataDir = "/home/nic/Documents";
      configDir = "/home/nic/Documents/.config/syncthing";
    };
  };

}
