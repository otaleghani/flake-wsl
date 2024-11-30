{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodejs_22
    yarn
    bun
    deno
    nodePackages.typescript-language-server
  ];
}
