-- set colorscheme to nightfly with protected call
-- in case it isn't installed
vim.o.termguicolor = true
local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
