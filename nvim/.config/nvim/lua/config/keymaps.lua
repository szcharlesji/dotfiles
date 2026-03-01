-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Search grep
-- vim.keymap.del("n", "<leader>sG")
-- vim.keymap.set("n", "<leader>fs", function()
--   Snacks.picker.grep()
-- end, { desc = "Search grep" })

-- Lazygit
-- vim.keymap.del("n", "<leader>l")
-- vim.keymap.set("n", "<leader>lg", function()
--   Snacks.lazygit()
-- end, { desc = "Lazygit (cwd)" })

-- LSP
-- vim.keymap.set("n", "gt", "<Nop>", { desc = "Go to next tab disabled" })
-- vim.keymap.set("n", "gT", "<Nop>", { desc = "Go to previous tab disabled" })
-- vim.keymap.set("n", "gt", function()
--   Snacks.picker.lsp_type_definitions()
-- end, { desc = "Go to type definition" })

-- Tab operations
-- vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Diagnostics
-- vim.keymap.set("n", "<leader>d", function()
--   vim.diagnostic.open_float()
-- end, { desc = "Show diagnostics" })

-- Remove debugger keymaps
-- vim.keymap.del("n", "<leader>dph")
-- vim.keymap.del("n", "<leader>dpp")
-- vim.keymap.del("n", "<leader>dps")

-- Treesitter
-- vim.keymap.del("v", "S")
-- vim.keymap.set("v", "S", "<Plug>(nvim-surround-visual)", { desc = "Surround selection" })
