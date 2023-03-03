local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_x = { "diff" },
		lualine_y = { "diagnostics", "progress" },
		lualine_a = { "buffers" },
		lualine_b = { "branch" },
		lualine_c = {},
		-- lualine_a = {
		-- 	{
		-- 		"buffers",
		-- 		show_filename_only = true, -- Shows shortened relative path when set to false.
		-- 		show_modified_status = true, -- Shows indicator when the buffer is modified.
		--
		-- 		mode = 0, -- 0: Shows buffer name
		-- 		-- 1: Shows buffer index
		-- 		-- 2: Shows buffer name + buffer index
		-- 		-- 3: Shows buffer number
		-- 		-- 4: Shows buffer name + buffer number
		-- 	},
		-- },
	},
})
