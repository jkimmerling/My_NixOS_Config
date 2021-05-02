{ config, lib, pkgs, ... }:

{
  programs.fish.enable = true;

  users.extraUsers.jasonk = {        
    shell = pkgs.fish;    
  };
  
  services = {
    gnome3.gnome-keyring.enable = true;
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };

    xserver = {
      enable = true;

      #layout = "us-custom";
      layout = "us";

      libinput = {
        enable = true;
        # touchpad.disableWhileTyping = true;
      };

      serverLayoutSection = ''
        Option "StandbyTime" "0"
        Option "SuspendTime" "0"
        Option "OffTime"     "0"
      '';

      displayManager = {
        autoLogin.enable = true;
        autoLogin.user = "jasonk";
        sddm.enable = true;
        defaultSession = "none+awesome";
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
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
