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

    conform.setup({
      notify_on_error = false,
      formatters_by_ft = {
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "eslint_d", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        -- yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt", "goimports-reviser", "golines" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
      },
    })
  end,
}

return config
