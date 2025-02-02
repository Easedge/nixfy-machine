{
  lib,
  config,
  pkgs,
  ...
}:

{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.gnome-remote-desktop.enable = true;

  services.geoclue2 = {
    enable = true;
    package = [
      pkgs.geoclue2
    ];
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
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-user-docs
    gnome.yelp
    gnome.geary
    gnome.totem
    gnome.cheese
    gnome.epiphany
    gnome.gnome-contacts
    gnome.gnome-music
    gnome.gnome-maps
  ];

  # programs.kdeconnect = {
  #   enable = true;
  #   package = pkgs.gnomeExtensions.gsconnect;
  # };
}
