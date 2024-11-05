require("user.options")
require("user.colorscheme")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup("plugins")
local builtin = require("telescope.builtin")
vim.keymap.set('n' , '<C-p>', builtin.find_files, {})
vim.keymap.set('n' , '<C-t>', ':Neotree filesystem reveal right <CR>')
vim.keymap.set('n' , '<C-g>', ':Neotree float git_status <CR>')

config = function()

	local configs = require("nvim.treesitter.configs")
	configs.setup({
		ensure_installed = {"lua","javascript","c","html","python","go","typescript"},
		highlight = { enable = true },
        	indent = { enable = true },  
	})
end
