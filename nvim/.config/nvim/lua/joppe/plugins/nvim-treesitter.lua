local languages = {
  "bash",
  "c",
  "css",
  "dockerfile",
  "gitignore",
  "go",
  "graphql",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "prisma",
  "query",
  "svelte",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
  "zig",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    -- replicate `ensure_installed`, runs asynchronously, skips existing languages
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter.setup", {}),
      callback = function(args)
        local buf = args.buf
        local filetype = args.match

        -- you need some mechanism to avoid running on buffers that do not
        -- correspond to a language (like oil.nvim buffers), this implementation
        -- checks if a parser exists for the current language
        local language = vim.treesitter.language.get_lang(filetype) or filetype

        if not vim.treesitter.language.add(language) then
          return
        end

        -- folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldnestmax = 3
        vim.wo.foldlevel = 99

        vim.treesitter.start(buf, language)

        -- indent
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.o.foldlevelstart = 99

    -- autotag
    require("nvim-ts-autotag").setup()

    -- textobjects plugin now uses its own setup + keymaps
    require("nvim-treesitter-textobjects").setup({
      move = {
        set_jumps = false,
      },
      select = {
        lookahead = true,
      },
    })
  end,
}
