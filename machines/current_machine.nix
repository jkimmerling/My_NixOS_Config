{ config, pkgs, ... }:

{

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
