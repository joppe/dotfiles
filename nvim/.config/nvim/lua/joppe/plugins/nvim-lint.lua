return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    local format_mode = os.getenv("NVIM_FORMAT") -- default "prettier"
    local linters = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      python = { "pylint" },
    }

    print("nvim-lint lint mode: " .. format_mode)

    if format_mode == "biome" then
      linters.javascript = { "biome" }
      linters.typescript = { "biome" }
      linters.javascriptreact = { "biome" }
      linters.typescriptreact = { "biome" }
      linters.svelte = { "biome" }
    elseif format_mode == "deno" then
      linters.javascript = { "deno" }
      linters.typescript = { "deno" }
      linters.javascriptreact = { "deno" }
      linters.typescriptreact = { "deno" }
      linters.svelte = { "deno" }
    end

    lint.linters_by_ft = linters
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint(nil, { ignore_errors = true })
    end, { desc = "Trigger linting for current file" })
  end,
}
