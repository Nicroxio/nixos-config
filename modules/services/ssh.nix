{config, pkgs, lib, ...}:{
  options = {
  ssh.enable = lib.mkEnableOption "Enable ssh server";
};  
config = lib.mkIf config.ssh.enable {
services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = false;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "yes"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};
};
}
