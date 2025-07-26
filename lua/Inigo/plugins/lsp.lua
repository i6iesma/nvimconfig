local keymaps = require("Inigo.core.keymaps") -- Import your keymaps module

local on_attach = function(client, bufnr)
  -- Safe check for supports_method to avoid nil errors in null-ls
  -- This logic remains the same as it interacts with Neovim's core LSP client
  if client.supports_method and client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting." .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

-- Remove all nvim-lspconfig + mason-lspconfig setup because coc.nvim manages LSPs

-- Setup none-ls for additional formatters and linters only
-- Changed from null-ls to none-ls
local none_ls_status, none_ls = pcall(require, "none-ls")
if none_ls_status then
  none_ls.setup({
    sources = {
      none_ls.builtins.formatting.stylua, -- Lua formatter
      none_ls.builtins.formatting.prettier.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "html",
          "css",
          "scss",
          "json",
          "yaml",
          "markdown",
        },
        extra_args = { "--single-quote", "--jsx-single-quote" },
      }),
      none_ls.builtins.diagnostics.eslint_d.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      }),
      -- add more sources here if needed
    },
    on_attach = on_attach,
  })
end

-- lspsaga setup (optional, works fine with coc.nvim)
require("lspsaga").setup({})

