return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
            return require "config.mason"
        end,
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function(_, opts)
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "omnisharp" },
            }
        end

    }
}
