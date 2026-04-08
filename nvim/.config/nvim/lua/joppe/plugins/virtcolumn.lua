return {
  "xiyaowong/virtcolumn.nvim",
  config = function()
    -- The column(s) to display — can be a single value or comma-separated list
    vim.g.virtcolumn_char = "▕" -- character used to draw the column (default: '|')
    vim.g.virtcolumn_priority = 10 -- extmark priority (default: 10)

    -- Set which column(s) to show (respects vim's colorcolumn format)
    vim.opt.colorcolumn = "80,120"
  end,
}
