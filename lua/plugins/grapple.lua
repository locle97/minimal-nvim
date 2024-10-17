return {
    "cbochs/grapple.nvim",
    keys = {
        { "<leader>mm", "<cmd>Grapple tag<cr>",            desc = "Tag a file" },
        { "<leader>hh", "<cmd>Grapple toggle_tags<cr>",    desc = "Toggle tags menu" },
        { "<leader>hf", "<cmd>Telescope grapple tags<cr>", desc = "Toggle telescope of tags menu" },

        { "<leader>1",  "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
        { "<leader>2",  "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
        { "<leader>3",  "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
        { "<leader>4",  "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
    },
    config = function()
        require("grapple").setup({
            icons = true,  -- setting to "true" requires "nvim-web-devicons"
            status = true,
            style = "basename",
        })
    end
}
