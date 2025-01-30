{ pkgs, ... }:
{
  programs.helix = {
    extraPackages = [
      pkgs.marksman
    ];
    settings = {
      enable = true;
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        end-of-line-diagnostics = "hing";
        cursor-shape.insert = "bar";
        inline-diagnostics.cursor-line = "error";
        true-color = true;
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };
}
