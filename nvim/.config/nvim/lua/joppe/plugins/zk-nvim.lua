return {
  "zk-org/zk-nvim",
  ft = "markdown",
  config = function()
    require("zk").setup({
      picker = "telescope",
    })
  end,
  keys = {
    { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "Zk New" },
  },
}
