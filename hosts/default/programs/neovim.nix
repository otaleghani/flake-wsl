{ config, pkgs, ... }:
{
  programs.neovim.enable = true;
  programs.neovim.extraLuaConfig = ''
    ${builtins.readFile ./neovim/remaps.lua}
    ${builtins.readFile ./neovim/options.lua}
    ${builtins.readFile ./neovim/plugins/lazynvim.lua}
    ${builtins.readFile ./neovim/plugins/lsp.lua}
    ${builtins.readFile ./neovim/plugins/lualine.lua}
    ${builtins.readFile ./neovim/plugins/nvimtree.lua}
    ${builtins.readFile ./neovim/plugins/palette.lua}
    ${builtins.readFile ./neovim/plugins/tabby.lua}
    ${builtins.readFile ./neovim/plugins/telescope.lua}
    ${builtins.readFile ./neovim/plugins/treesitter.lua}
    vim.o.laststatus = 3
  '';
}
