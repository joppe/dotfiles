return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    local linters = {
      python = { "pylint" },
    }

    if vim.fs.root(0, { "eslint.config.js" }) ~= nil then
      print("nvim-lint lint mode: eslint")

      linters.javascript = { "eslint" }
      linters.typescript = { "eslint" }
      linters.javascriptreact = { "eslint" }
      linters.typescriptreact = { "eslint" }
      linters.svelte = { "eslint" }
    elseif vim.fs.root(0, { "biome.json" }) ~= nil then
      print("nvim-lint lint mode: deno")

      linters.javascript = { "biomejs" }
      linters.typescript = { "biomejs" }
      linters.javascriptreact = { "biomejs" }
      linters.typescriptreact = { "biomejs" }
      linters.svelte = { "biomejs" }
    elseif vim.fs.root(0, { ".oxlintrc.json" }) ~= nil then
      print("nvim-lint lint mode: oxlint")

      linters.javascript = { "oxlint" }
      linters.typescript = { "oxlint" }
      linters.javascriptreact = { "oxlint" }
      linters.typescriptreact = { "oxlint" }
      linters.svelte = { "oxlint" }
    elseif vim.fs.root(0, { "deno.json", "deno.jsonc" }) ~= nil then
      print("nvim-lint lint mode: deno")

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
