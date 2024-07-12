local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ev', '<Cmd>tabe $MYVIMRC<CR><Cmd>cd %:h<CR>', opts)

vim.api.nvim_set_keymap('', '<leader><CR>', '<Cmd>silent !$TERM &<CR>', opts)

vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)

vim.api.nvim_set_keymap('', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<A-l>', '<Cmd>BufferNext<CR>', opts)

vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-n><Esc>a" : "<CR>"', {expr = true, noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>Trouble lsp_definitions<cr>", opts)
vim.api.nvim_set_keymap("n", "gT", "<cmd>Trouble lsp_type_definitions<cr>", opts)

vim.api.nvim_set_keymap('n', 'ga', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('v', 'ga', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rr', ':Lspsaga rename<CR>', opts)
vim.api.nvim_set_keymap('n', 'gn', ':Lspsaga diagnostic_jump_prev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gN', ':Lspsaga diagnostic_jump_next<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>NvimTreeFindFile<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>f', "<Cmd>lua require'telescope.builtin'.find_files()<CR>", {silent=false, noremap=true})
vim.api.nvim_set_keymap('n', '<leader>G', "<Cmd>lua require'telescope.builtin'.grep_string{search = '' }<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>g', "<Cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>s', "<Cmd>lua require'telescope.builtin'.grep_string()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>b', "<Cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h', "<Cmd>lua require'telescope.builtin'.help_tags()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>t', "<Cmd>lua require'telescope.builtin'.treesitter()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>d', "<Cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<CR>", opts)
