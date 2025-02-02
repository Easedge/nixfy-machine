{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./systemservices.nix
      ./systempackages.nix
      ./shellsettings.nix
      ./network.nix
      ./virtualisation.nix
      ./desktop
      ./programs
      ./nvidia
      # ./gpu-pass
    ];

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.consoleMode = "max";
  # boot.loader.systemd-boot.configurationLimit = 3;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.default = "0"; # Select the second boot item, counting from 0
  boot.loader.grub.configurationLimit = 3;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
  boot.loader.grub.useOSProber = true;

  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];

  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.plasma6Support = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-configtool
    ];
    # enabled = "ibus";
    # ibus.engines = with pkgs.ibus-engines; [
    #   libpinyin
    #   rime
    # ];
  };

  users.users.junglefish = {
    isNormalUser = true;
    description = "junglefish";
    # initialPassword = "admin";
    shell = pkgs.bashInteractive;
    extraGroups = [
      "wheel"
      "tty"
      "audio"
      "video"
      "networkmanager"
      "lp"
      "docker"
      "kvm"
      "libvirtd"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      junglefish = import ../home/home.nix;
    };
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = [ "root" "junglefish" ];
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  system.stateVersion = "23.11";
}

