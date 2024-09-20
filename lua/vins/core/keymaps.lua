vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- exit keymap
keymap.set("n", "<leader>qq", "<CMD>qa<CR>", { desc = "Quit nvim" })

-- lazy keymap
keymap.set("n", "<Leader>l", "<CMD>Lazy<CR>", { desc = "Toggle Lazy menu" })

-- remove highlight
keymap.set("n", "<Esc>", "<CMD>nohl<CR>", { desc = "Removeing search highlight" })

-- saving file keymap
keymap.set({ "n", "i", "x" }, "<C-s>", "<CMD>write %<CR><ESC>", { desc = "Save current file" })
keymap.set({ "n", "x" }, "<leader>w", "<CMD>wa<CR><ESC>", { desc = "Save all file" })

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- navigate window
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window Management
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontaly" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window verticaly" })
keymap.set("n", "<leader>sc", "<C-w>c", { desc = "Close window" })
keymap.set("n", "<leader>sn", "<C-w>n", { desc = "Split new window" })

keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Equalize windows" })
keymap.set("n", "<C-Down>", "<CMD>horizontal resize -3<CR>", { desc = "Resize - window horizontaly" })
keymap.set("n", "<C-Up>", "<CMD>horizontal resize +3<CR>", { desc = "Resize + window horizontaly" })
keymap.set("n", "<C-Left>", "<CMD>vertical resize -3<CR>", { desc = "Resize - window verticaly" })
keymap.set("n", "<C-Right>", "<CMD>vertical resize +3<CR>", { desc = "Resize + window verticaly" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap.set("n", "<leader>bd", function()
  require("vins.utils.ui").bufremove()
end, { desc = "Delete Buffer" })
keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
keymap.set("n", "<leader>bl", "<CMD>Telescope buffers<CR>", { desc = "List all buffers" })

-- Add undo break-points
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- tabs
keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap.set("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
