
{ config, lib, pkgs, ... }:

let
  espDev = "/dev/disk/by-uuid/0D1E-EB26";
  btrfsDev = "/dev/disk/by-uuid/ac35f90a-17fa-4aeb-b634-8f7467c50374";
  swapDev = "/dev/disk/by-uuid/bbfbc673-4c99-4111-babb-0ac9a188f3b2";

  subvolume = name: {
    device = btrfsDev;
    fsType = "btrfs";
    options = [ "subvol=/${name}" "compress-force=zstd" ];
  };

in {
  fileSystems = {
    "/" = subvolume "@";
    "/home" = subvolume "@home";
    "/nix" = subvolume "@nix";
    "/.subvols" = subvolume "";

    "/boot" = {
      device = espDev;
      fsType = "vfat";
    };
  };

  swapDevices = [ { device = swapDev; } ];
}
