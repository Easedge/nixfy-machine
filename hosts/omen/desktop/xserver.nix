{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.xkb.layout = "cn";

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  # xdg.portal.configPackages [ pkgs.gnome-session ];
  # xdg.portal.wlr.enable = true;
  # xdg.portal.wlr.settings = { };

  sound.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
}
