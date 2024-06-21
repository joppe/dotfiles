return {
  "zbirenbaum/nvterm",
  init = function()
    vim.keymap.set("n", "<leader>h", function()
      require("nvterm.terminal").new("horizontal")
    end)
    vim.keymap.set("n", "<leader>v", function()
      require("nvterm.terminal").new("vertical")
    end)
    -- Exit from insert mode by Esc in Terminal
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
  end,
  config = function(_, opts)
    require("nvterm").setup(opts)
  end,
}
