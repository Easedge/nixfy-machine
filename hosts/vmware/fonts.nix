{ config, pkgs, ... }:
{
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
}
