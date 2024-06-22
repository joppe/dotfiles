return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = function()
    -- A hunk is a part of a file that has been changed. It can be a new line, a
    -- changed line, or a deleted line. Gitsigns can show these hunks in the
    -- sign column of the buffer. The signs are configurable, and the default
    -- signs are `+` for added lines, `~` for changed lines, and `_` for deleted
    -- lines. The `topdelete` sign is used for the top line of a deleted hunk,
    -- and the `changedelete` sign is used for a line in a hunk that has been
    -- changed and deleted. The `on_attach` function is called when the plugin
    -- is attached to a buffer. It sets up keybindings for navigating between
    -- hunks and previewing hunks.
    local options = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<leader>gp",
          require("gitsigns").prev_hunk,
          { buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
        )
        vim.keymap.set(
          "n",
          "<leader>gn",
          require("gitsigns").next_hunk,
          { buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
        )
        vim.keymap.set(
          "n",
          "<leader>ph",
          require("gitsigns").preview_hunk,
          { buffer = bufnr, desc = "[P]review [H]unk" }
        )
      end,
    }

    return options
  end,
}
