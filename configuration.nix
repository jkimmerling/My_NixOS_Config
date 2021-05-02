
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./file_system/btrfs.nix
      ./hardware-configuration.nix
      ./machines/current_machine.nix
      ./development/includes.nix
      ./nvidia/nvidia-offload.nix
      ./fonts_themes/fonts.nix

    ];

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "America/New_York";


  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jasonk = {
     isNormalUser = true;
     extraGroups = [ "wheel" "postgres" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget vim
     firefox
     networkmanagerapplet
     alacritty
     gitFull
     kitty
     polybar
     compton
     fish
     pciutils
     acpi
     lm_sensors
     steam
     #steam-run
     neofetch
     pavucontrol
     rofi
     pywal
     calc
     networkmanager_dmenu
     dmenu
     remmina
     xfce.thunar xfce.xfconf xfce.tumbler xfce.exo
     xfce.mousepad
     zip unzip
     xwinwrap mpv
     glances
     todo-txt-cli
     cachix
     python3
     # for rofi screen shot tool
     ffcast
     slop
     xclip
     ffmpeg
     xorg.xwininfo
     python38Packages.feedparser
     jq
  ];
  programs.steam.enable = true;
  nix.trustedUsers = [ "root" "jasonk" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  nix.autoOptimiseStore = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

}
