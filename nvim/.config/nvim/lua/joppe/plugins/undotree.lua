return {
  "mbbill/undotree",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<F5>", "<cmd> UndotreeToggle <CR>", { desc = "Toggle undotree" })
  end,
}
