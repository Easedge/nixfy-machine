{ config, pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  # time.hardwareClockInLocalTime = true;

  fonts = {
    packages = with pkgs; [
      corefonts
      ubuntu_font_family
      material-design-icons
      font-awesome
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
      wqy_zenhei
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];

    fontDir.enable = true;
    fontconfig.enable = true;
    fontconfig.cache32Bit = true;

    enableDefaultPackages = true;
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" ];
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
    # type = "fcitx5";
    # fcitx5.plasma6Support = true;
    # fcitx5.waylandFrontend = true;
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-chinese-addons
    #   fcitx5-configtool
    # ];
  };
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

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
  ];

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "cn";
  services.xrdp.audio.package = pkgs.pulseaudio-module-xrdp;
  services.packagekit.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ ];
  xdg.portal.xdgOpenUsePortal = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.openssh.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.direnv.enable = true;
  programs.bash = {
    enableLsColors = true;
    completion.enable = true;
    blesh.enable = true;
    shellInit = ''
      eval "$(direnv hook bash)"
    '';
    interactiveShellInit = ''
      eval "$(direnv hook bash)"
    '';
    promptInit = ''
      if [ -n "$BASH_VERSION" ]; then
        export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]\w\[\e[0m\] \$ '
      else
        if [ "$UID" -eq 0 ]; then
          export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f %# "
        else
          export PROMPT="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$ "
        fi
      fi
      export PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    '';
    shellAliases = {
      # emc = "emacsclient";
    };
  };

}
