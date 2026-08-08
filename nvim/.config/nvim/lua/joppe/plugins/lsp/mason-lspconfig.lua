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
        "cssls",
        "denols",
        "emmet_ls",
        "html",
        "lua_ls",
        "svelte",
        "tailwindcss",
        "ts_ls",
        "zls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "js-debug-adapter",
        "eslint-lsp",
        "isort",
        "oxfmt",
        "oxlint",
        "prettier", -- prettier formatter
        "pylint",
        "stylua", -- lua formatter
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = {
        "css",
        "html",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "typescriptreact",
      },
    })

    vim.lsp.config("zls", {
      root_dir = function(_, on_dir)
        local is_zig_project = vim.fs.root(0, { "build.zig" })

        if is_zig_project ~= nil then
          on_dir(vim.fn.getcwd())
        end
      end,
      capabilities = capabilities,
      single_file_support = true,
    })

    vim.lsp.config("ts_ls", {
      root_dir = function(_, on_dir)
        local is_ts_project = vim.fs.root(0, { "package.json" })

        if is_ts_project ~= nil then
          on_dir(vim.fn.getcwd())
        end
      end,
      capabilities = capabilities,
      single_file_support = false,
    })

    vim.lsp.config("denols", {
      root_dir = function(_, on_dir)
        local is_ts_project = vim.fs.root(0, { "deno.json", "deno.jsonc" })

        if is_ts_project ~= nil then
          on_dir(vim.fn.getcwd())
        end
      end,
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

    vim.lsp.config("eslint", {
      root_dir = function(_, on_dir)
        local is_eslint_project = vim.fs.root(0, { "eslint.config.js" })

        if is_eslint_project ~= nil then
          on_dir(vim.fn.getcwd())
        end
      end,
      capabilities = capabilities,
    })

    vim.lsp.config("oxlint", {
      root_dir = function(_, on_dir)
        local is_oxlint_project = vim.fs.root(0, { ".oxlintrc.json" })

        if is_oxlint_project ~= nil then
          on_dir(vim.fn.getcwd())
        end
      end,
      capabilities = capabilities,
    })
  end,
}
