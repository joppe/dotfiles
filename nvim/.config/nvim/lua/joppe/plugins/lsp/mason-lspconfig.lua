return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_installation = true, -- automatically install servers
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint-lsp",
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
      },
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      single_file_support = false,
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim", "Snacks" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- when pnp is used with yarn eslint cannot be found, this can be fixed by setting the nodePath to the .yarn/sdks directory
    local nodePath = ""
    local project_marker = { "yarn.lock", "package-lock.json", "pnpm-lock.yaml" }
    local project_root = vim.fs.root(0, project_marker)

    if project_root ~= nil then
      local pnp_sdks = vim.fn.expand(project_root .. "/.yarn/sdks")

      if vim.fn.isdirectory(pnp_sdks) ~= 0 then
        print("eslint: pnp detected setting nodePath to .yarn/sdks")
        nodePath = pnp_sdks
      end
    end

    vim.lsp.config("eslint", {
      capabilities = capabilities,
      settings = {
        nodePath = nodePath,
      },
    })
  end,
}
