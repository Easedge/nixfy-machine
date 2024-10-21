{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    ./diskoconfig.nix
  ] ++ [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.consoleMode = "max";
  # boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # boot.supportedFilesystems = [ "ntfs" ];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.default = "0"; # Select the second boot item, counting from 0
  # boot.loader.grub.configurationLimit = 3;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
  # boot.loader.grub.useOSProber = true;

  boot.initrd.availableKernelModules = [ "ata_piix" "mptspi" "uhci_hcd" "ehci_pci" "ahci" "xhci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.blacklistedKernelModules = [ ];
  boot.extraModulePackages = [ ];


  networking.hostName = "vmware";
  networking.proxy.default = "http://192.168.31.180:8080/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  virtualisation.vmware.guest.enable = true;

  hardware.pulseaudio.enable = false;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

}
