local cmp_status, cmp = pcall(require, "nvim-cmp")
if not cmp_status then
    print("error isntalling cmp")
    return
end


local luasnip = require("luasnip")
local lspkind = require("lspkind") -- For nice icons

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet expand function for snippets to work
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },      -- LSP source
        { name = "luasnip" },       -- Snippets source
        { name = "buffer" },        -- For text in the current buffer
        { name = "path" },          -- For file system paths
        -- { name = "cmdline" },     -- For command line completion
        -- { name = "calc" },        -- For calculator
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            ellipsis_char = '...',
            -- You can customize the symbols here if nvim-web-devicons is not providing them
            -- symbol_map = {
            --     Text = "󰉿", Method = "󰆧", Function = "󰆧", Constructor = "", Field = "󰜢", Variable = "󰀫",
            --     Class = "󰠱", Interface = "", Module = "󰕳", Property = "󰜢", Unit = "󰡡", Value = "󰎦",
            --     Enum = " enumeration", Keyword = " key", Snippet = "󰆐", Color = " 󰏘", File = "󰈔",
            --     Reference = "󰈇", Folder = "󰉋", EnumMember = "󰡃", Constant = "󰏿", Struct = "󰙅", Event = "󰪮",
            --     Operator = "󰐬", TypeParameter = "󰊄",
            -- }
        }),
    },
})
