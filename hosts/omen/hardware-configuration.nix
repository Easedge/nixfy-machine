{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports =
    [
      ./diskoconfig.nix
    ]
    ++ [
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

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.opengl.enable = true;
  hardware.uinput.enable = true;
  hardware.steam-hardware.enable = true;
  
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
