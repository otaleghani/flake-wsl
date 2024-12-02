local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')


local on_attach = function(client, bufnr)
local opts = {buffer = bufnr, remap = false}
 vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
 vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
 vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
 vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
 -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
 -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
 -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
 -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
 -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
 -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
 -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
 -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp_zero.on_attach(on_attach)

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format({details = false}),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})


local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- dart
lsp_config.dartls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_dir = lsp_config.util.root_pattern("pubspec.yaml", ".git"),
  settings = {}
}

-- rust
lsp_config.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = lsp_config.util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        allFeatures = true,
        checkOnSave = { command = "clippy" },
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
}

-- golang
lsp_config.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_dir = lsp_config.util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}


-- csharp
lsp_config.csharp_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  --cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs" },
  root_dir = lsp_config.util.root_pattern("*.sln", "*.csproj", ".git"),
})

-- nix
lsp_config.nil_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "nil" },
  filetypes = { "nix" },
  root_dir = lsp_config.util.root_pattern("default.nix", "shell.nix", ".git", "flake.nix"),
  settings = {}
}


-- typescript
lsp_config.ts_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_dir = lsp_config.util.root_pattern("package.json", "tsconfig.json", ".git"),
    settings = {}
}

-- tailwind
-- lsp_config.tailwindcss.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "tailwindcss-language-server", "--stdio" },
--   filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
--   root_dir = lsp_config.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "postcss.config.js", ".git"),
--   settings = {
--     tailwindCSS = {
--       lint = {
--         cssConflict = "warning",
--         invalidApply = "error",
--         invalidConfigPath = "error",
--         invalidScreen = "error",
--         invalidTailwindDirective = "error",
--         invalidVariant = "error",
--         recommendedVariantOrder = "warning",
--       },
--     }
--   }
-- }


-- lua
lsp_config.lua_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = lsp_config.util.root_pattern("*.lua", ".git"),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

