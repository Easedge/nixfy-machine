{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  services.xserver.xkb.layout = "cn";

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  # xdg.portal.configPackages [ pkgs.gnome-session ];
  # xdg.portal.wlr.enable = true;
  # xdg.portal.wlr.settings = { };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
