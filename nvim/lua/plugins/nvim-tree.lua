local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

nvim_tree.setup({
	hijack_directories = {
		enable = true,
	},

	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" },
	},

	update_cwd = true,

	--   error
	--   info
	--   question
	--   warning
	--   lightbulb
	renderer = {
		highlight_git = true,
		highlight_opened_files = "name",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},

		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},

			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},

				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},

	diagnostics = {
		enable = true,
	},

	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},

	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},

	view = {
		width = 34,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
		},
		number = true,
		relativenumber = true,
	},
})
