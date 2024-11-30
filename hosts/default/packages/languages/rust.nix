{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rustc           # compiler
    rustfmt         # formatter
    rustup
    rust-analyzer   # language server
    clippy          # linter
    cargo           # package manager
    cargo-watch     # rebuilder
    cargo-audit     # dependency security checker
    cargo-outdated  # dependency security checker
    cargo-edit      # dependency manager
    cargo-binutils
    cargo-generate
    wasm-pack
    llvm
  ];
}
