{config, pkgs, lib, ...}:{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "nic";
    dataDir = "/home/nic/Documents";
    configDir = "/home/nic/Documents/.config/syncthing";
  };


}
