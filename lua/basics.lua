vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.wo.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.lazyredraw = true
vim.o.ttimeoutlen = 10
vim.wo.wrap = false
vim.o.updatetime = 300
vim.o.completeopt = 'menuone,preview,noinsert'
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true
vim.wo.signcolumn = 'yes'

vim.diagnostic.config({virtual_text = false})
vim.diagnostic.enable(false)

-- https://github.com/lucasvianav/nvim/blob/62ac5c2aa8abb25094d7d896c3b58a0936c13984/lua/functions/utilities.lua#L39-L48
function trim_trailing_whitespaces()
	local cmd = vim.api.nvim_command
	if not vim.o.binary and vim.o.filetype ~= 'diff' then
		local current_view = vim.fn.winsaveview()
		cmd([[keeppatterns %s/\s\+$//e]])
		vim.fn.winrestview(current_view)
	end
end

vim.api.nvim_command([[
	autocmd BufWritePre * :lua trim_trailing_whitespaces()
]])

local signs = { Error = '', Warn = '', Hint = '', Info =  ''}
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.protocol.CompletionItemKind = {
	'   (Text) ',
	'   (Method)',
	'   (Function)',
	'   (Constructor)',
	' ﴲ  (Field)',
	'[] (Variable)',
	'   (Class)',
	' ﰮ  (Interface)',
	'   (Module)',
	' 襁 (Property)',
	'   (Unit)',
	'   (Value)',
	' 練 (Enum)',
	'   (Keyword)',
	'   (Snippet)',
	'   (Color)',
	'   (File)',
	'   (Reference)',
	'   (Folder)',
	'   (EnumMember)',
	' ﲀ  (Constant)',
	' ﳤ  (Struct)',
	'   (Event)',
	'   (Operator)',
	'   (TypeParameter)'
}
