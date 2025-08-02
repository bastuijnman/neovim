vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
            });
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {}
    }
}
