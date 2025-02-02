{ lib, config, pkgs, ... }: {
  home.packages = with pkgs;
    [
      nixfmt-rfc-style
      nixpkgs-fmt
      pandoc
      libxml2
      graphviz
      gnuplot
      clang-tools
      cmake-language-server
      glslang
      jdk
      jdt-language-server
      python3
      pipenv
      gopls
      gomodifytags
      gotests
      gore
      gotools
      cargo
      rustc
      rust-analyzer
      shfmt
      shellcheck
      html-tidy
      stylelint
      dockfmt
      dockerfile-language-server-nodejs
      texliveMedium
      sqlite
      wordnet
      languagetool
    ] ++ (with python3Packages; [
      grip
      python-lsp-server
      jupyter
      black
      pyflakes
      isort
      pynose
      pytest
      jsbeautifier
    ]);

  home.sessionVariables = {
    # GUIX_PROFILE = "/home/junglefish/.config/guix/current";
  };
}
