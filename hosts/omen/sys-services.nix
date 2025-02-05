{ config, pkgs, ... }:

{
  services.printing.enable = true;

  services.udev.packages = with pkgs; [
    android-udev-rules
    game-devices-udev-rules
    logitech-udev-rules
  ];

  security.polkit.enable = true;
  security.rtkit.enable = true;

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

  services.daed = {
      enable = true;
      openFirewall = {
        enable = true;
        port = 12345;
      };
  };
}
