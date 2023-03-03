--Auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

--Import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

--Packer plugins list
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	--LSP
	use("neovim/nvim-lspconfig")

	--LSP Managing & Installation :servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--LSP Cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")

	--LSP Servers
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	--use("jose-elias-alvarez/typescript.nvim") may be
	use("onsails/lspkind.nvim")

	--LSP Formatting & Linting :files
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	--Syntax
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	--Plugins for better exp
	--use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	--use("nvim-tree/nvim-tree.lua")
	use("numToStr/Comment.nvim")
	use("akinsho/toggleterm.nvim")

	--Much plugins use it
	use("nvim-lua/plenary.nvim")

	--Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("saadparwaiz1/cmp_luasnip")

	--Git integration
	use("lewis6991/gitsigns.nvim")

	--Auto closing
	use("windwp/nvim-autopairs")

	--Neovim debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	--Debugger specific extensions
	use("leoluz/nvim-dap-go")
	use("simrat39/rust-tools.nvim")
	use("mxsdev/nvim-dap-vscode-js")

	--Cosmetics
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use("nvim-lualine/lualine.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("kyazdani42/nvim-web-devicons")

	--Colorscheme
	use({ "bluz71/vim-moonfly-colors", branch = "cterm-compat" })
end)
