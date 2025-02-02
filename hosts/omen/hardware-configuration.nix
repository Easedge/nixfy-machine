{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_stable;
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];
  boot.kernelPatches = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ ];
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIX";
    fsType = "btrfs";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  # swapDevices =
  #   [{ device = "/dev/disk/by-label/SWAP"; }];

  zramSwap.enable = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.opengl.enable = true;
  hardware.uinput.enable = true;
  hardware.steam-hardware.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
      DiscoverableTimeout = 0;
    };
  };

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}
