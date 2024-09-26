return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
            })
        end
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                -- optional configuration here
                transparent = true
            })
        end
    },
}
