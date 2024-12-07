-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymap options
local opts = { noremap = true, silent = true }

-- Increment/Decrement
vim.keymap.set("n", "+", "<C-a>", opts)
vim.keymap.set("n", "-", "<C-x>", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Save file and quit
vim.keymap.set("n", "<Leader>w", ":update<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":quit<CR>", opts)
vim.keymap.set("n", "<Leader>Q", ":qa<CR>", opts)

-- Tabs
vim.keymap.set("n", "te", ":tabedit<CR>", opts)
vim.keymap.set("n", "<tab>", ":tabnext<CR>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)
vim.keymap.set("n", "<C-w>", ":tabclose<CR>", opts)

-- Split window
vim.keymap.set("n", "ss", ":split<CR>", opts)
vim.keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move window
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- Resize window
vim.keymap.set("n", "<C-S-h>", "<C-w><", opts)
vim.keymap.set("n", "<C-S-l>", "<C-w>>", opts)
vim.keymap.set("n", "<C-S-k>", "<C-w>+", opts)
vim.keymap.set("n", "<C-S-j>", "<C-w>-", opts)

-- Diagnostics
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Moving lines up and down with Alt + j/k
vim.keymap.set("n", "<A-Up>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-Down>", ":m .-2<CR>==", opts)

-- Visual mode move lines up and down with Alt + j/k
vim.keymap.set("v", "<A-Up>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-Down>", ":m '<-2<CR>gv=gv", opts)

-- Copy, Cut, Paste
vim.keymap.set("v", "<C-c>", '"+y', opts)  -- Copy
vim.keymap.set("v", "<C-x>", '"+d', opts)  -- Cut
vim.keymap.set("n", "<C-v>", '"+P', opts)  -- Paste normal mode
vim.keymap.set("v", "<C-v>", '"+P', opts)  -- Paste visual mode

-- Find inside file
vim.keymap.set("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Find globally
vim.keymap.set("n", "<C-A-f>", ":Telescope live_grep<CR>", opts)

-- Replace (Ctrl+h for current file, Ctrl+Shift+h for global replace)
vim.keymap.set("n", "<C-h>", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", opts)
vim.keymap.set("n", "<C-S-h>", ":Telescope live_grep<CR>", opts)

-- Multiple cursors (using vim-visual-multi plugin for multi-cursor)
vim.keymap.set("n", "<C-d>", ":call vm#commands#find_next('n')<CR>", opts)

-- Open file explorer
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", opts)

-- Map Ctrl+P to Telescope find files (project-wide)
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opts)

-- Switch between tabs using Alt + arrow keys
vim.keymap.set("n", "<A-Left>", ":tabprev<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":tabnext<CR>", opts)

-- LSP actions
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)

-- Formatting
vim.keymap.set("n", "<Leader>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
