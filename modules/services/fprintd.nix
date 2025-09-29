{
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
  };
  services.fprintd.enable = true;

}
