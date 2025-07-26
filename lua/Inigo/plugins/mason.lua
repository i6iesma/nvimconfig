-- ~/.config/nvim/lua/Inigo/plugins/mason.lua

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    -- Optional: Ensure these servers are installed automatically on first run
    -- You can add more language servers here based on your needs
    ensure_installed = {
        "lua_ls",
        "jsonls",
        "tsserver",
        "html",
        "cssls",
        "pyright", -- For Python
        "rust_analyzer", -- For Rust
        "eslint_d", -- For ESLint (via null-ls)
        "prettier", -- For Prettier (via null-ls)
    },
})
