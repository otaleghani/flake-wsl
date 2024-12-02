{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # nixos
      SystemUpdate = "sudo nixos-rebuild switch --flake ~/flake#default";
      SystemEdit = "nvim ~/flake";
      
      # misc
      vim = "nvim";

      # git 
      ga = "git add";
      gaa = "git add --all";
      gcmsg = "git commit --message";
      gl = "git pull";
      gu = "git push";

      # cat and ls alternatives
      ls = "eza";
      cat = "bat";
    };

    history = {
      size = 10000;
      #path = 
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };

    initExtra = ''
      # bindkeyes
      # autosuggest
      bindkey "^f" autosuggest-accept 	# Accepts the current suggestion.
      bindkey "^e" autosuggest-execute 	# Accepts and executes the current suggestion.
      bindkey "^c" autosuggest-clear 		# Clears the current suggestion.
      bindkey "^w" autosuggest-fetch 		# Fetches a suggestion (works even when suggestions are disabled).
      # bindkey "^ " autosuggest-disable	# Disables suggestions.
      # bindkey "^ " autosuggest-enable 	# Re-enables suggestions.
      # bindkey "^ " autosuggest-toggle 	# Toggles between enabled/disabled suggestions.
      
      eval "$(starship init zsh)"
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/github
      export PATH=$PATH:/home/nixos/dev-utils/
      clear
    '';
  };
}
