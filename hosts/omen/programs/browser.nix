{ input, pkgs, ... }:
{
  programs.chromium.enable = true;

  # programs.firefox.enable = true;
  # programs.firefox.package = pkgs.firefox-esr;
}
