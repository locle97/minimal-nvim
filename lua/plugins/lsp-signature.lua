return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        handler_opts = {
            border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
        },
        hint_enable = true,
        hint_prefix = '󰇥 ',
        floating_window = true,
        floating_window_off_y = -2
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end
}
