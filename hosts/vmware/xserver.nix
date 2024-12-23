{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "cn";
  services.xrdp.audio.package = pkgs.pulseaudio-module-xrdp;
  services.packagekit.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ ];
  xdg.portal.xdgOpenUsePortal = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
