{ pkgs, lib, inputs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.default

    # You'll find the default packages here
    ./packages/base.nix

    ./packages/databases/sqlite.nix
    ./packages/databases/postgresql.nix

    ./packages/tools/docker.nix

    ./packages/languages/c.nix
    ./packages/languages/csharp.nix
    ./packages/languages/dart.nix
    ./packages/languages/go.nix
    ./packages/languages/lua.nix
    ./packages/languages/nix.nix
    ./packages/languages/python.nix
    ./packages/languages/rust.nix
    ./packages/languages/typescript.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "nixos" = import ./home.nix; };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This is needed because if not home-manager would not source the needed files.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "24.11";
}
