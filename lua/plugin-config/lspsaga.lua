local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'ga', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('v', 'ga', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>r', ':Lspsaga rename<CR>', opts)
vim.api.nvim_set_keymap('n', 'gn', ':Lspsaga diagnostic_jump_prev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gN', ':Lspsaga diagnostic_jump_next<CR>', opts)

require('lspsaga').setup({
    lightbulb = {
        enable = false, -- disables both
        virtual_text = false, -- disables just the one at the end of the line
    }
})
