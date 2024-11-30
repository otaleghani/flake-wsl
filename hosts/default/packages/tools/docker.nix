{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    docker-slim
    dive
    hadolint
    kubectl
    lazydocker
  ];
}
