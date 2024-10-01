return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup {
            open_mapping = [[<c-\>]],
            direction = "float",
            shade_terminals = true,
            shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "bash",
        }
    end,
}

