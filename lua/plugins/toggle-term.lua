return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        local utility = require("utility")

        require("toggleterm").setup {
            open_mapping = [[<c-\>]],
            direction = "float",
            shade_terminals = true,
            shell = utility.shell,
        }
    end,
}

