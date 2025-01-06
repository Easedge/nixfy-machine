{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;

  environment.shells = [
    pkgs.bashInteractive
    # pkgs.fish
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    tree
    p7zip
    unrar
    unzip
    gnutls
    fd
    ripgrep
    pciutils
    nixpkgs-fmt
    niri
    xwayland-satellite
    waybar
    fuzzel
    alacritty
    kitty
  ];

  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
