{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    historyControl = [ "ignoredups" "erasedups" ];
    historyFileSize = 200000;
    historyIgnore = [ "ls" "cd" "pwd" "exit" ];
    historySize = 100000;
    shellOptions = [ "histappend" "cmdhist" "checkwinsize" ];
    initExtra = ''
      # Keep history synced across terminals in real time.
      if [[ -n "$PROMPT_COMMAND" ]]; then
        PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
      else
        PROMPT_COMMAND="history -a; history -n"
      fi

      # Live syntax highlighting while typing (green valid commands, red invalid).
      source "${pkgs.blesh}/share/blesh/ble.sh"

      # Override blesh defaults: bash builtins (like `cd`) should be green.
      ble-face -s command_builtin fg=green
      ble-face -s command_builtin_dot fg=green,bold

      eval "$(starship init bash)"
    '';
    shellAliases = {
      ll = "ls -la";
      ".." = "cd ..";
    };
  };
}