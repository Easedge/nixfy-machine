{ lib, config, pkgs, ... }:

{
  # programs.fish = {
  #   enable = true;
  #   vendor.functions.enable = true;
  #   shellInit = ''
  #     direnv hook fish | source
  #   '';
  #   promptInit = "set -g direnv_fish_mode eval_on_arrow";
  #   shellAliases = {
  #     emc = "emacsclient";
  #   };
  # };

  programs.bash = {
    enableLsColors = true;
    enableCompletion = true;
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
      emc = "emacsclient";
    };
  };

  environment.shells = [
    pkgs.bashInteractive
    # pkgs.fish
  ];

}
