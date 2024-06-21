return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    local function close_buffer()
      vim.cmd("bd")
      vim.cmd("bnext")
    end

    vim.keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<leader>x", function()
      close_buffer()
    end, {})
  end,
}
