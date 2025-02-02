{ ... }:
{
  imports = [
    ./browser.nix
    ./cuda.nix
    # ./emacs.nix
    # ./steam.nix
    # ./teamviewer.nix
    ./neovim.nix
    ./tmux.nix
    ./sing-box.nix
  ];

  programs.adb.enable = true;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
  programs.nix-ld.enable = true;
  programs.mtr.enable = true;
}
