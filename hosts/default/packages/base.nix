{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    tmux
    git
    unzip
    bc  	            # Basic calculator
    nnn		            # File manager
    fzf               # Fuzzy finder
    jq                # JSON formatter
    httpie            # HTTP client
    bat               # cat alternative
    eza               # ls alternative
  ];
}
