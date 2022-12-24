local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end
dap.setup()

local dap_virt_text_ok, dap_virt_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virt_text_ok then
	return
end
dap_virt_text.setup()

local dap_ui_ok, dapui = pcall(require, "dapui")
if not dap_ui_ok then
	return
end

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				-- "stacks",
				-- "watches",
			},
			size = 40, -- 40 columns
			position = "right",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
-------exstensions--------

--golang
local dapgo_ok, dapgo = pcall(require, "dap-go")
if not dapgo_ok then
	return
end
dapgo.setup()

--rust
local rust_tools_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_ok then
	return
end
rust_tools.setup()

--javascript and typescript
local js_ts_ok, vscode_js = pcall(require, "dap-vscode-js")
if not js_ts_ok then
	return
end
vscode_js.setup()
