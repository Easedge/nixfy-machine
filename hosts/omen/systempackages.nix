{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # pkgs.stable.xxx
    # util
    tree
    wget
    curl
    p7zip
    unrar
    unzip
    gnupg
    gnutls
    fish
    # home-manager
    appimage-run
    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    bpftrace # powerful tracing tool
    lsof # list open files
    # system tools
    ethtool
    bridge-utils
    pciutils # lspci
    usbutils # lsusb
    efibootmgr
    # complie
    gcc
    gdb
    gnumake
    # mobile
    ifuse
    libimobiledevice
  ];

  programs.adb.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;

}
