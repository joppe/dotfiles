-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Use relative line numbers
vim.opt.relativenumber = true

vim.g.dap_virtual_text = true

-- Exit from insert mode by Esc in Terminal
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
