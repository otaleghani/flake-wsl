{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    nix
    nixfmt
    nixpkgs-fmt
    nil                 # nix lsp
    nix-diff
    nix-prefetch-git
  ];
}
