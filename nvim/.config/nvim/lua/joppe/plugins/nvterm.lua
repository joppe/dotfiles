return {
  "zbirenbaum/nvterm",
  init = function()
    vim.keymap.set("n", "<leader>h", function()
      require("nvterm.terminal").new("horizontal")
    end, { desc = "Open terminal horizontally" })
    vim.keymap.set("n", "<leader>v", function()
      require("nvterm.terminal").new("vertical")
    end, { desc = "Open terminal vertically" })
    -- Exit from insert mode by Esc in Terminal
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
  end,
  config = function(_, opts)
    require("nvterm").setup(opts)
  end,
}
