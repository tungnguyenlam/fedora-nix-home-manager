{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "tungnguyenlam";
        email = "nguyenlamtung2005@gmail.com";
      };
      alias = {
        st = "status";
        co = "checkout";
      };
    };
  };
}