{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python3
    python312Packages.pip         # package manager
    python312Packages.pytest      # testing framework
    virtualenv                    # isolated python environment
    poetry                        # dependency manager
    pylint                        # linter
    black                         # formatter
    mypy                          # static type checker
    pylyzer
  ];
}
