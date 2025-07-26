vim.g.mapleader = " "
local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>h", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
-- windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-W>S") -- split window horizontally
keymap.set("n", "<leader>se", "<C-") -- make split windows equal W
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split wi
--tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ": tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ": tabp<CR>") -- go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvimtree
-- keymap.set("n", "<leader>et", function()
-- 	vim.cmd(":w")
-- 	vim.cmd(":NvimTreeToggle")
-- end)
--
keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", function()
	vim.cmd(":w")
	vim.cmd(":NvimTreeFocus")
end)

-- keymap.set("n", "<leader>eh", "<C-h>") -- open while splitting horizontally

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

--Color picker
keymap.set("n", "<leader>co", "<cmd>PickColor<cr>")


local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end


vim.api.nvim_set_keymap('i', '<Tab>', [[
  coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
]], { expr = true, silent = true })


vim.keymap.set('i', '<CR>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    -- Changed the string literal from double quotes to Lua long string [[...]]
    -- This prevents Lua from trying to interpret Vimscript escape sequences like \<C-g> and \<CR>
    return [[\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>]]
  end
end, {
  expr = true,
  silent = true
})


