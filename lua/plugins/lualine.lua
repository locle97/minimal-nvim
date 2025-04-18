return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local utils = require('config.lualine-utils')

        require('lualine').setup {
            options = { theme = 'catppuccin' },
            sections = {
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'grapple', 'filename' },
                lualine_x = { 'diagnostics', utils.lsp, 'fileformat', 'filetype' },
            }
        }
    end
}
