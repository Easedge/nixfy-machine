{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  # services.xserver.displayManager.startx.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "cn";

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  # xdg.portal.configPackages [ pkgs.gnome-session ];
  # xdg.portal.config = {
  #   common = {
  #     default = [
  #       "gtk"
  #     ];
  #   };
  # };
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  # xdg.portal.wlr.enable = true;
  # xdg.portal.wlr.settings = { };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
