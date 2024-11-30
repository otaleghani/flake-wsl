{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    csharp-ls
    dotnet-sdk_8
  ];
}
