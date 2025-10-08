{config , pkgs, ...}:{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [80 443 22000]
    allowedUDPPorts
  };
}
