return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local utils = require('config.lualine-utils')

        require('lualine').setup {
            options = { theme = 'catppuccin' },
            sections = {
                lualine_b = { 'branch' },
                lualine_c = { 'grapple', 'buffers' },
                lualine_x = { 'diff', 'diagnostics', utils.lsp, 'fileformat', 'filetype' },
            }
        }
    end
}
