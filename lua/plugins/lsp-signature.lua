return {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
        handler_opts = {
            border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
        },
        hint_enable = true,
        hint_prefix = '󰇥 ',
        hint_scheme = "Type",
        floating_window = false
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end
}
