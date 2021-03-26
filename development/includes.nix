{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./vscode.nix
      #./postgres.nix
      ./MySQL.nix
      ./vscodium.nix
    ];

}
