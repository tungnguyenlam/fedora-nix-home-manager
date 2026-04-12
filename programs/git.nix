{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "tungnguyenlam";
    userEmail = "nguyenlamtung2005@gmail.com";
    aliases = {
      st = "status";
      co = "checkout";
    };
  };
}