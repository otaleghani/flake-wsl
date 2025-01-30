{ config, pkgs, ... }:

{
  imports = [
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/neovim.nix
    ./programs/tmux.nix
    ./programs/helix.nix
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    cowsay
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
