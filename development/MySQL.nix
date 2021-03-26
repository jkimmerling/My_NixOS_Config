{ config, lib, pkgs, ... }:

{
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql;
  services.mysql.dataDir = "/var/db";

  #systemd.services.mysql.serviceConfig.Restart = "on-failure";
  #systemd.services.mysql.serviceConfig.RestartSec = "10s";

  services.mysqlBackup.enable = true;
  services.mysqlBackup.user = "root";
  services.mysqlBackup.databases = [ "home" ];
}
