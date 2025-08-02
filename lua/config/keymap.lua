-- Buffer keymaps
vim.keymap.set("n", "<leader>b", "", { desc = "Buffers" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Buffer delete" })
vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<CR>", { desc = "Buffer list" })
