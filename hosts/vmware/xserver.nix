{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "cn";
  services.xrdp.audio.package = pkgs.pulseaudio-module-xrdp;
  # services.packagekit.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  xdg.portal.xdgOpenUsePortal = true;
  xdg.portal.config = {
    common = {
      default = [
        "gtk"
      ];
    };
  };
  xdg.portal.wlr.settings = { };
  xdg.portal.configPackages = [ ];


  security.polkit.enable = true;
  security.rtkit.enable = true;
}
