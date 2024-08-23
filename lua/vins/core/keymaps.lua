vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- exit keymap
keymap.set("n", "<leader>qq", "<CMD>qa<CR>", { desc = "Quit nvim" })

-- remove highlight
keymap.set("n", "<Esc><Esc>", "<CMD>nohl<CR>", { desc = "Removeing search highlight" })

-- saving file keymap
keymap.set({ "n", "i", "x" }, "<C-s>", "<CMD>write %<CR><ESC>", { desc = "Save current file" })
keymap.set({ "n", "x" }, "<leader>w", "<CMD>wa<CR><ESC>", { desc = "Save all file" })

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
