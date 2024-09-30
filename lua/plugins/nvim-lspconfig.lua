return {
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require "config.lspconfig"

            -- Using border for LspInfo
            require('lspconfig.ui.windows').default_options.border = 'single'
        end,
    }
}
