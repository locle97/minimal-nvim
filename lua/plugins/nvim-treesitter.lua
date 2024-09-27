return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "vim",
            "lua",
            "vimdoc",
            "html",
            "css",
            "c_sharp",
            "python",
            "json"
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },

        indent = { enable = true },
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
