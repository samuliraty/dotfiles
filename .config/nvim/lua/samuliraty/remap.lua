vim.g.mapleader = " "

-- Open the file explorer in the current window
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move the selected lines one line down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move the selected lines one line up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without losing cursor position in normal mode
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll down half a screen and recenter the screen in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll up half a screen and recenter the screen in normal mode
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search next occurrence and recenter the screen in normal mode
vim.keymap.set("n", "n", "nzzzv")

-- Search previous occurrence and recenter the screen in normal mode
vim.keymap.set("n", "N", "Nzzzv")

-- Paste from the system clipboard in normal, visual, and visual block modes
vim.keymap.set({ "n", "v", "x" }, "<leader>p", [["+p]])

-- Yank selected text into system clipboard in normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank from cursor to end of line into system clipboard in normal mode
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Yank current line into system clipboard in normal mode
vim.keymap.set("n", "<leader>yy", [["+yy]])

-- Exit insert mode to normal mode using Ctrl+C
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the functionality of the Q key in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Create a new tmux window running the tmux-sessionizer script
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the code using Language Server Protocol
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move to the next error in quickfix list and recenter the screen in normal mode
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Move to the previous error in quickfix list and recenter the screen in normal mode
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Move to the next linting error and recenter the screen in normal mode
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Move to the previous linting error and recenter the screen in normal mode
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the word under cursor throughout the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Save and switch to netrw
vim.api.nvim_set_keymap('n', 'ZZ', ':w<CR>:e .<CR>', { noremap = true, silent = true })
vim.cmd[[ command! WQ w | e . ]]
