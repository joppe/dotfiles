return {
  "saecki/crates.nvim",
  ft = { "toml" },
  config = function(_, opts)
    local crates = require("crates")

    crates.setup(opts)

    -- Setup cmp source for autocomplete
    require("cmp").setup.buffer({
      sources = { { name = "crates" } },
    })

    crates.show()

    vim.keymap.set("n", "<leader>rcu", function()
      require("crates").upgrade_all_crates()
    end)
  end,
}
