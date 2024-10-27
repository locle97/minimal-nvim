return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        handler_opts = {
            border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
        },
    },
    config = function()
        require "lsp_signature".setup({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        })
    end
}
