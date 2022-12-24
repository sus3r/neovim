-- import treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"lua",
		"bash",
		"json",

		"css",
		"html",
		"javascript",
		"typescript",

		"tsx",
		"yaml",

		"markdown",
		"svelte",
		"graphql",

		"dockerfile",

		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
})
