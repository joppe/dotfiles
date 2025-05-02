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
    local format_mode = os.getenv("NVIM_FORMAT") -- default "prettier"
    local formatters = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      svelte = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      graphql = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt", "goimports-reviser", "golines" },
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
    }

    print("conform format mode: " .. format_mode)

    if format_mode == "biome" then
      formatters.javascript = { "biome" }
      formatters.typescript = { "biome" }
      formatters.javascriptreact = { "biome" }
      formatters.typescriptreact = { "biome" }
      formatters.css = { "biome" }
      formatters.html = { "biome" }
      formatters.json = { "biome" }
      formatters.graphql = { "biome" }
    elseif format_mode == "deno" then
      formatters.javascript = { "deno_fmt" }
      formatters.typescript = { "deno_fmt" }
      formatters.javascriptreact = { "deno_fmt" }
      formatters.typescriptreact = { "deno_fmt" }
      formatters.css = { "deno_fmt" }
      formatters.html = { "deno_fmt" }
      formatters.json = { "deno_fmt" }
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
