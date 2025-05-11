require("nvchad.options")

local o = vim.o
local g = vim.g
local opt = vim.opt

g.mapleader = " "

g.gitblame_enabled = false
g.gitblame_date_format = '%r'
g.gitblame_highlight_group = 'GitBlameMessage'

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.wrap = false

opt.relativenumber = true

vim.filetype.add({
    -- Detect and assign filetype based on the extension of the filename
    extension = {
        cql = "cypher",
        cypher = "cypher",
        resx = "xml",
    },
})

vim.cmd('highlight St_Lsp guifg=#94e2d5')

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"

vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
