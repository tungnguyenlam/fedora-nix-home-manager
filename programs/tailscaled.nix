{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    tailscale
  ];

  systemd.user.services.tailscaled = {
    Unit = {
      Description = "Tailscale VPN daemon (userspace)";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.tailscale}/bin/tailscaled --tun=userspace-networking --state=%h/.local/share/tailscale/tailscaled.state --socket=%h/.tailscaled.sock";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}