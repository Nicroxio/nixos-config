{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.hermes.enable = lib.mkEnableOption "Enable hermes";

  config = lib.mkIf config.hermes.enable {
    services.hermes-agent = {
      enable = true;
      settings.model.default = "deepseek-v4-flash";
      addToSystemPackages = true;
      environmentFiles = [ config.boot.secrets.hermes.path ];
    };
  };
}
