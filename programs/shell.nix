{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gh
    nodejs
    ripgrep
    fd
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}