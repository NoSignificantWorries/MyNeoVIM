local map = vim.keymap.set

-- Exit INSERT mode
map("i", "jj", "<ESC>", { desc = "ESC remap" })
map("i", "оо", "<ESC>", { desc = "ESC remap" })

-- Terminal working
map("t", "<A-q>", "<C-\\><C-n>", { desc = "Quit terminal mode" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

--Disconnecting arrows
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true })

-- Buffers working
map("n", "<C-Tab>", "<CMD>bnext<CR>", { desc = "Go to next buffer" })
map("n", "<C-S-Tab>", "<CMD>bprevious<CR>", { desc = "Go to previous buffer" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- lsp
map("n", "<leader>d", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics under cursor" })

-- Terminal
map("t", "<C-q>", "<C-\\><C-n>", { desc = "Quit terminal mode" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Langmapper for russian keyboard layout
local function escape(str)
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
	escape(ru_shift) .. ";" .. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")
