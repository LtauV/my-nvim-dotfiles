require("user.options")
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

local plugins = {
	{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	dependencies = {
      	"nvim-lua/plenary.nvim",
      	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      	"MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    		}
	}	
}

local opts = {}

require("lazy").setup(plugins, opts)
require("user.colorscheme")
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
