{ config, lib, pkgs, modulesPath, ... }:
{
  networking.hostName = "omen";
  networking.networkmanager.enable = true;
  networking.iproute2.enable = true;

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  # networking.firewall.allowedTCPPorts = [ 7000 7001 7100 ];
  # networking.firewall.allowedUDPPorts = [ 6000 6001 7011 ];
  networking.firewall.enable = lib.mkForce false;
}
