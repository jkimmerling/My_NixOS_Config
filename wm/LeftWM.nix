{ config, lib, pkgs, ... }:

{
  services = {
    gnome3.gnome-keyring.enable = true;
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };

    xserver = {
      enable = true;

      #extraLayouts.us-custom = {
      #  description = "US layout with custom hyper keys";
      #  languages   = [ "eng" ];
      #  symbolsFile = ./us-custom.xkb;
      #};

      #layout = "us-custom";
      layout = "us";

      #libinput = {
      #  enable = true;
      #  touchpad.disableWhileTyping = true;
      #};

      serverLayoutSection = ''
        Option "StandbyTime" "0"
        Option "SuspendTime" "0"
        Option "OffTime"     "0"
      '';

      #displayManager = {
      #  defaultSession = "none+leftwm";
      #};

      windowManager.leftwm = {
        enable = true;
        # enableContribAndExtras = true;

      };

      xkbOptions = "caps:ctrl_modifier";

    };
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  systemd.services.upower.enable = true;
}
