-- tab movement
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<A-l>', '<Cmd>BufferNext<CR>', opts)
