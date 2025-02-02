{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    teamviewer # rustdesk todesk
  ];
  services.teamviewer.enable = true;
}
