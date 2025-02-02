{ ... }:
{
  imports = [
    ./fonts.nix
    ./xserver.nix
    ./flatpak-bindfs.nix
    ./gnomepackages.nix
    # ./plasmapackages.nix
  ];
}
