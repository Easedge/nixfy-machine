{ lib, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs.emacsPackages; [
    vterm
    mu4e
    mu4e-alert
  ];


  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs-gtk;
  };

  # environment.pathsToLink = [
  #   "/share/emacs/site-lisp/"
  # ];

}
