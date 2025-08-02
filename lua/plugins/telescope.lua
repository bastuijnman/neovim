return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope Find Files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telsecope Live Grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope Buffers' })
    end
}
