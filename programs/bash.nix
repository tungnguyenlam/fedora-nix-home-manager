{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
    '';
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
  };
}