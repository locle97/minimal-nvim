return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                background = {
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true,
                custom_highlights = function(C)
                    return {
                        -- Cmp Menu
                        TelescopeSelection = {
                            fg = C.flamingo or C.text,
                            bg = C.surface0 or C.none,
                            style = { "bold" },
                        },
                    }
                end
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
}
