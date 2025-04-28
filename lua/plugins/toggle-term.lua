return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup {
            direction = "float",
            shade_terminals = true,
            shell = "/bin/fish"
        }
    end,
}

