{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vicmd_symbol = "[❮](bold yellow)";
      };
      directory = {
        truncation_length = 3;
        style = "bold cyan";
      };
      git_branch = {
        style = "bold purple";
      };
      git_status = {
        style = "bold red";
      };
      cmd_duration = {
        style = "bold yellow";
        min_time = 1000;
      };
    };
  };
}