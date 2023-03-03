local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Use jk to exit insert mode
map("i", "jk", "<ESC>", opts)

--Clear search highlights
map("n", "<space>nhl", ":nohl<CR>", opts)

--Save & Quit
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)

--Erase/Next buffer
map("n", "<A-q>", ":bw<CR>", opts)

--Next/Previous buffer
map("n", "{", ":bn<CR>", opts)
map("n", "}", ":bp<CR>", opts)

--Window navigator
map("n", "<A-k>", ":wincmd k<CR>", opts)
map("n", "<A-j>", ":wincmd j<CR>", opts)
map("n", "<A-h>", ":wincmd h<CR>", opts)
map("n", "<A-l>", ":wincmd l<CR>", opts)

--Moving lines
map("n", "<S-j>", ":m .+1<CR>==", opts)
map("n", "<S-k>", ":m .-2<CR>==", opts)
map("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-------------------PLUGINS KEYBINDS--------------------
--ToggleTerm
map("n", "<space>t", ":ToggleTerm<CR>", opts)
map("n", "<space>e", ":NvimTreeToggle<CR>", opts)
--FZF
map("n", "fp", "<cmd>:FZF<CR>", opts)

--File explorer
-- map("n", "<space>e", ":NvimTreeToggle<CR>", opts)

--Telescope
-- map("n", "gs", "<cmd>:Telescope grep_string<CR>", opts)
-- map("n", "rg", "<cmd>:Telescope live_grep<CR>", opts)
-- map("n", "fb", "<cmd>:Telescope buffers<CR>", opts)
-- map("n", "of", "<cmd>:Telescope oldfiles<CR>", opts)
-- map("n", "<space>mk", "<cmd>:Telescope keymaps<CR>", opts)

--Telescope git
-- map("n", "<space>gc", "<cmd>Telescope git_commits<cr>", opts)
-- map("n", "<space>gfc", "<cmd>Telescope git_bcommits<cr>", opts)
-- map("n", "<space>gb", "<cmd>Telescope git_branches<cr>", opts)
-- map("n", "<space>gs", "<cmd>Telescope git_status<cr>", opts)

--Gitsigns
map("n", "g[", ":Gitsigns next_hunk<CR>", opts)
map("n", "g]", ":Gitsigns prev_hunk<CR>", opts)
map("n", "<space>gh", ":Gitsigns preview_hunk<CR>", opts)

--LSP keybinds
map("n", "<space>res", ":LspRestart<CR>", opts)

------------------------DEBBUGER-------------------------
map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<space>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<space>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<space>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
map("n", "<space>dr", ":lua require'dap'.repl.open()<CR>", opts)
map("n", "<space>dl", ":lua require'dap'.run_last()<CR>", opts)
map("n", "<space>dt", ":lua require'dap-go'.debug_test<CR>", opts)

-----FUNCTIONS-----
--Restore last position
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.api.nvim_exec("normal! g'\"", false)
		end
	end,
})
