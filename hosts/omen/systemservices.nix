{ config, pkgs, ... }:

{
  services.xserver.xkb.layout = "cn";
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.libinput.enable = true;
  services.printing.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ ];
  xdg.portal.xdgOpenUsePortal = true;

  services.udev.packages = with pkgs; [
    android-udev-rules
    game-devices-udev-rules
  ];

  sound.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };

  services.fwupd.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.v2raya.enable = true;
  services.usbmuxd.enable = true;
}
