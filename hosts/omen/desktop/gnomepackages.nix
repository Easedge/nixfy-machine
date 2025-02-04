{
  lib,
  config,
  pkgs,
  ...
}:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.gnome-remote-desktop.enable = true;

  services.geoclue2 = {
    enable = true;
    # package = [
    #   pkgs.geoclue2
    # ];
    # enableDemoAgent = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.pomodoro
    gnomeExtensions.pano
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-assistant
    gnomeExtensions.paperwm
    gnomeExtensions.solaar-extension
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    yelp
    geary
    gnome-contacts
  ];

  # programs.kdeconnect = {
  #   enable = true;
  #   package = pkgs.gnomeExtensions.gsconnect;
  # };
}
