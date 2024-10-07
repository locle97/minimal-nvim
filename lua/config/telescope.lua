local actions = require('telescope.actions')
local options = {
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
        },
        mappings = {
            n = {
                ["q"] = require("telescope.actions").close,
                ["<C-o>"] = actions.send_selected_to_qflist + actions.open_qflist
            },
            i = {
                ["<C-o>"] = actions.send_selected_to_qflist + actions.open_qflist
            },
        },
        path_display = {
            "filename_first"
        },
    },

    extensions_list = {},
    extensions = {},
}

return options
