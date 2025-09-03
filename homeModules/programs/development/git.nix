{config, lib, pkgs, ...}:{
  options = {
    git.enable = lib.mkEnableOption "enables git.nix";
  };

  config = lib.mkIf config.git.enable{
    programs.git = {
      enable = true;
      userName = "Nicroxio";
      userEmail = "Ferdi@nicroxio.co.uk";
    };
  };

}
