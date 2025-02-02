{ lib, config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    clinfo
    mesa-demos
    vulkan-tools
    wayland-utils
  ] ++ (with pkgs.kdePackages; [
    discover
    dragon
    kate
    kcalc
    kwallet
    kio-extras
  ]);

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    khelpcenter
  ];

  programs.kdeconnect = {
    enable = true;
  };

  programs.chromium = {
    enablePlasmaBrowserIntegration = true;
  };

  programs.dconf.enable = true;
  programs.partition-manager.enable = true;

  services.colord.enable = true;
  services.geoclue2.enable = true;
  services.packagekit.enable = true;
}
