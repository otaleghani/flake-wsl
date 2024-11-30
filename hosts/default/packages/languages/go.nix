{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    go
    delve           # debugger
    gosec           # security checker
    golangci-lint   # linter
    gopls           # language server
  ];
}
