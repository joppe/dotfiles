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
    local format_mode = os.getenv("NVIM_FORMAT") -- default "ma"
    local formatters = {
      javascript = { "eslint_d", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      svelte = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      graphql = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt", "goimports-reviser", "golines" },
    }

    print("Conform mode: " .. format_mode)

    if format_mode == "prettier" then
      formatters.javascript = { "prettierd", "prettier", stop_after_first = true }
      formatters.yaml = { "prettierd", "prettier", stop_after_first = true }
    elseif format_mode == "biome" then
      formatters.javascript = { "biome" }
      formatters.typescript = { "biome" }
      formatters.javascriptreact = { "biome" }
      formatters.typescriptreact = { "biome" }
      formatters.css = { "biome" }
      formatters.html = { "biome" }
      formatters.json = { "biome" }
      formatters.graphql = { "biome" }
    end

    conform.setup({
      notify_on_error = false,
      formatters_by_ft = formatters,
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
