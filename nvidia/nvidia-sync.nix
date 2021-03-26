{ config, pkgs, ... }:

{
services.xserver.videoDrivers = [
 "nvidia"
];

hardware = {
 nvidia = {
   prime = {
     sync.enable = true;
     nvidiaBusId = "PCI:1:0:0";
     intelBusId = "PCI:0:2:0";
   };
 };
};
}
