{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lua
    luarocks        # package manager
    luajit          # jit compiler
    lua-language-server
  ];
}
