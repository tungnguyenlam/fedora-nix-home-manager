{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # or pkgs.vscodium
  };
}