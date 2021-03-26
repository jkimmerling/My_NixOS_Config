{ config, pkgs, lib, ... }: {

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_10;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all ::1/128 trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE wgu WITH LOGIN PASSWORD 'wgu' CREATEDB;
      CREATE DATABASE wgu;
      GRANT ALL PRIVILEGES ON DATABASE wgu TO wgu;
    '';
  };
}
