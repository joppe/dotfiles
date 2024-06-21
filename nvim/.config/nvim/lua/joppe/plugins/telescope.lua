return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      verion = "^1.0.0",
    },
  },
  config = function()
    local builtin = require("telescope.builtin")

    require("telescope").load_extension("live_grep_args")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
