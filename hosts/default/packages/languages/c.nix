{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc             # compiler 
    gcc_multi       
    glibc_multi     
    libgcc
    gdb             # debugger
    clang           # alternative compiler
    llvm            # toolchain
    ccls            # language server
  ];
}
