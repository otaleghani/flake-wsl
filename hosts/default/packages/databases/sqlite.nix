{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sqlite
    sqlite-analyzer
    sqlite-utils
  ];
}
