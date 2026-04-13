{ config, lib, pkgs, ... }:

{
  # Basic Home Manager info
  home.username = "tungnguyen";
  home.homeDirectory = "/home/tungnguyen";
  home.stateVersion = "25.05"; # Update this when you update Nixpkgs inputs

  imports = [
    ./programs/shell.nix
    ./programs/tailscaled.nix
    ./programs/git.nix
    ./programs/bash.nix
    ./programs/direnv.nix
    ./programs/starship.nix
  ];

  # Let Home Manager install itself permanently
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Quick installs: add one package name per line here for tools that need no extra config.
  home.packages = with pkgs; [
    vesktop
  ];
}
