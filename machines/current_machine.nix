{ config, pkgs, ... }:

{
#let
#  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
#    export __NV_PRIME_RENDER_OFFLOAD=1
#    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
#    export __GLX_VENDOR_LIBRARY_NAME=nvidia
#    export __VK_LAYER_NV_optimus=NVIDIA_only
#    exec -a "$0" "$@"
#  '';
#in
# {
#  environment.systemPackages = [ nvidia-offload ];
#
#  services.xserver.videoDrivers = [ "nvidia" ];
#  hardware.nvidia.prime = {
#    offload.enable = true;
#
#    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
#    intelBusId = "PCI:0:2:0";
#
#    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
#    nvidiaBusId = "PCI:1:0:0";
#  };






  # Use the GRUB 2 boot loader.
  boot = {
    #kernelPackages = pkgs.linuxPackages_5_8;
    loader = {
      grub = {
        enable  = true;
        device = "/dev/nvme1n1"; # or "nodev" for efi only
        version = 2;
      };
    };
  };

  services.openssh.enable = true;

  networking = {
    hostName = "jasonk-home";
    interfaces.wlp82s0.useDHCP = true;
    interfaces.enp0s31f6.useDHCP = true;
    networkmanager.enable = true;
  };

#  fileSystems."/data" = {
#    device = "/dev/nvme0n1p3";
#    fsType = "ext4";
#  };

####   NVIDIA    ####

#services.xserver.videoDrivers = [ 
# "nvidia" 
#];
#
#hardware = {
# nvidia = {
#   prime = {
#     sync.enable = true;
#     nvidiaBusId = "PCI:1:0:0";
#     intelBusId = "PCI:0:2:0";
#   };
# };
#};
hardware = { 
 opengl = {
   driSupport = true;
   driSupport32Bit = true;
 };
};

  services.picom = {
    backend = "xrender";
  };

  services.xserver = {
    deviceSection = ''
      Option "NoLogo" "1"
    '';

    screenSection = ''
      Option "TripleBuffer" "1"
    '';

   # extraConfig = ''
   #   Section "Extensions"
   #     Option "Composite" "Enable"
   #   EndSection
   # '';
  };

}
