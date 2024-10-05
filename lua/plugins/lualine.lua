return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local utils = require('config.lualine-utils')

        require('lualine').setup {
            options = { theme = 'catppuccin' },
            sections = {
                lualine_x = { utils.lsp_msg, utils.lsp, 'fileformat', 'filetype' },
            }
        }
    end
}
