local cmp = require "cmp"

local cmp_ui = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
}
local cmp_style = cmp_ui.style

local field_arrangement = {
    atom = { "kind", "abbr", "menu" },
    atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
    -- default fields order i.e completion word + item.kind + item.kind icons
    fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

    format = function(_, item)
        local icons = require "nvchad.icons.lspkind"
        local icon = (cmp_ui.icons and icons[item.kind]) or ""

        if cmp_style == "atom" or cmp_style == "atom_colored" then
            icon = " " .. icon .. " "
            item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
            item.kind = icon
        else
            icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
            item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
        end

        return item
    end,
}

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local options = {
    completion = {
        completeopt = "menu,menuone",
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    formatting = formatting_style,

    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        -- ["<CR>"] = function(fallback)
        --     -- Don't block <CR> if signature help is active
        --     -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
        --     if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
        --         fallback()
        --     else
        --         cmp.confirm({
        --             -- Replace word if completing in the middle of a word
        --             -- https://github.com/hrsh7th/nvim-cmp/issues/664
        --             behavior = cmp.ConfirmBehavior.Replace,
        --             -- Don't select first item on CR if nothing was selected
        --             select = false,
        --         })
        --     end
        -- end,

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "copilot" },
        -- Default source
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = 'nvim_lsp_signature_help' },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
    options.window.completion.border = border "CmpBorder"
end

return options
