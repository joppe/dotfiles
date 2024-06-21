return {
  "mfussenegger/nvim-dap",
  init = function()
    vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
    vim.keymap.set("n", "<leader>dus", function()
      local widgets = require("dap.ui.widgets")
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end)
  end,
}
