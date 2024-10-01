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
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "omnisharp",
                    "emmet_language_server",
                    "jsonls",
                    "ts_ls",
                    "pylsp",
                    "angularls",
                    "netcoredbg"
                },
            }
        end

    }
}
