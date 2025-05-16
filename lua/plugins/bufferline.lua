return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        require("bufferline").setup {
            options = {
                diagnostics = "nvim_lsp",
                style_preset = { bufferline.style_preset.minimal, bufferline.style_preset.no_italic }, -- or bufferline.style_preset.minimal,
            }
        }
    end
}
