{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    # ./lsp.nix
    # ./mail.nix
  ];

  home.packages = with pkgs; [
    # pkgs.stable.xxx
    # utils
    fastfetch
    htop
    # sdcv
    scrcpy
    imagemagick
    fd
    ripgrep
    # code
    vscode-fhs
    # jetbrains.pycharm-community
    # jetbrains.idea-community
    cmake
    aspell
    aspellDicts.en
    aspellDicts.en-science
    aspellDicts.en-computers
    # common desktop software
    google-chrome
    qbittorrent
    # calibre
    qq
    telegram-desktop
    # element-desktop
    spotify
    uxplay
    localsend
    # logseq
    # onlyoffice-bin
    obs-studio
    gimp
    # bottles
  ];
}
