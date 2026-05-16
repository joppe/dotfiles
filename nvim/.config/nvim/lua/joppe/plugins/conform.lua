local config = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fmt",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    local conform = require("conform")

    local formatters = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt", "goimports-reviser", "golines" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
    }

    if vim.fs.root(0, { "biome.json" }) ~= nil then
      print("conform format mode: biome")

      formatters.javascript = { "biome", "biome-organize-imports" }
      formatters.typescript = { "biome", "biome-organize-imports" }
      formatters.javascriptreact = { "biome", "biome-organize-imports" }
      formatters.typescriptreact = { "biome", "biome-organize-imports" }
      formatters.css = { "biome", "biome-organize-imports" }
      formatters.html = { "biome" }
      formatters.json = { "biome" }
      formatters.graphql = { "biome" }
    elseif vim.fs.root(0, { ".oxfmtrc.jsonc" }) ~= nil then
      print("conform format mode: oxfmt")

      formatters.javascript = { "oxfmt" }
      formatters.typescript = { "oxfmt" }
      formatters.javascriptreact = { "oxfmt" }
      formatters.typescriptreact = { "oxfmt" }
      formatters.css = { "oxfmt" }
      formatters.html = { "oxfmt" }
      formatters.json = { "oxfmt" }
    elseif vim.fs.root(0, { "deno.json", "deno.jsonc" }) ~= nil then
      print("conform format mode: deno")

      formatters.javascript = { "deno_fmt" }
      formatters.typescript = { "deno_fmt" }
      formatters.javascriptreact = { "deno_fmt" }
      formatters.typescriptreact = { "deno_fmt" }
      formatters.css = { "deno_fmt" }
      formatters.html = { "deno_fmt" }
      formatters.json = { "deno_fmt" }
    elseif vim.fs.root(0, { ".prettierrc" }) ~= nil then
      print("conform format mode: prettier")

      formatters.javascript = { "prettierd", "prettier", stop_after_first = true }
      formatters.typescript = { "prettierd", "prettier", stop_after_first = true }
      formatters.javascriptreact = { "prettierd", "prettier", stop_after_first = true }
      formatters.typescriptreact = { "prettierd", "prettier", stop_after_first = true }
      formatters.svelte = { "prettierd", "prettier", stop_after_first = true }
      formatters.css = { "prettierd", "prettier", stop_after_first = true }
      formatters.html = { "prettierd", "prettier", stop_after_first = true }
      formatters.json = { "prettierd", "prettier", stop_after_first = true }
      formatters.markdown = { "prettierd", "prettier", stop_after_first = true }
      formatters.graphql = { "prettierd", "prettier", stop_after_first = true }
      formatters.yaml = { "prettierd", "prettier", stop_after_first = true }
    end

    conform.setup({
      notify_on_error = false,
      formatters_by_ft = formatters,
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 1500,
        lsp_fallback = true,
      },
    })
  end,
}

return config
