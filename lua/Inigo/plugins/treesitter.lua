-- ~/.config/nvim/lua/Inigo/plugins/treesitter.lua

require("nvim-treesitter.configs").setup({
    -- Add languages you want to parse
    ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "html", "css", "json", "yaml", "markdown", "markdown_inline",
        -- Add more languages as needed
    },
    -- Install parsers synchronously (only once after setup)
    sync_install = false,
    -- Automatically install missing parsers when you open a file
    auto_install = true,

    highlight = {
        enable = true, -- Enable syntax highlighting
        -- Disable treesitter for large files to improve performance
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    indent = { enable = true }, -- Enable indentation

    -- Optional: Configure additional modules
    -- nvim-treesitter-textobjects (for advanced text objects)
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         lookasides = {
    --             ["af"] = { query = "@function.outer", desc = "around function" },
    --             ["if"] = { query = "@function.inner", desc = "inside function" },
    --         },
    --     },
    -- },
})
