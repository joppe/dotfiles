return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        always_show_bufferline = true,
      },
    })

    local function close_buffer()
      vim.cmd("bd")
      vim.cmd("bnext")
    end

    vim.keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>x", function()
      close_buffer()
    end, { desc = "Close buffer" })
  end,
}
