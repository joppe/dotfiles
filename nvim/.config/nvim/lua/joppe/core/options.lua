local opt = vim.opt
local o = vim.o
local g = vim.g

-- Indenting
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Numbers
opt.number = true
opt.relativenumber = true

-- Windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

o.clipboard = "unnamedplus"
o.cursorline = true
opt.termguicolors = true

-- Mapping
g.mapleader = " "

-- disable netrw at the very start of your init.lua
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
