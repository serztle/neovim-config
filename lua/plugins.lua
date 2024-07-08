local packer = require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'drewtempelmeyer/palenight.vim'
    use 'tpope/vim-surround'
    use 'scrooloose/nerdcommenter'
    use {
		'nvim-lualine/lualine.nvim',
		requires = 'nvim-tree/nvim-web-devicons'
    }
    use 'mhinz/vim-startify'
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'

    use 'nvim-tree/nvim-web-devicons'
    use 'lewis6991/gitsigns.nvim'

    use {
        'romgrk/barbar.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'folke/lsp-trouble.nvim'
    use 'folke/lsp-colors.nvim'
    use 'nvimdev/lspsaga.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    use 'godlygeek/tabular'
    use 'norcalli/nvim-colorizer.lua'
    use 'Glench/Vim-Jinja2-Syntax'
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }
    use 'tpope/vim-fugitive'
end)

require('lspconfig').pyright.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').gopls.setup({})
require('gitsigns').setup({})
require('colorizer').setup({})
require('nvim-tree').setup({})
require('todo-comments').setup({})
require('trouble').setup({})
require('ibl').setup({})

vim.cmd('colorscheme palenight')
vim.api.nvim_command('let g:palenight_terminal_italics=1')

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

require('lualine').setup({
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_b = {
            'branch',
            {'diff', source = diff_source},
            'diagnostics'
        }
    }
})

require('lspsaga').setup({
    lightbulb = {
        enable = false,
        virtual_text = false,
    }
})

local actions = require('telescope.actions')
local trouble = require('trouble.sources.telescope')
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<CR>'] = actions.select_default + actions.center,
                ['<ESC>'] = actions.close,
                ['<C-t>'] = trouble.open,
            },
            n = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<ESC>'] = actions.close,
                ['<C-t>'] = trouble.open,
            }
        }
    }
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'rust', 'php', 'python', 'latex', 'bibtex', 'javascript', 'go'},
    sync_install = false,
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            return lang == 'javascript' or lang == 'json' or vim.api.nvim_buf_line_count(bufnr) > 5000
        end,
    },
}

local cmp = require('cmp')
cmp.setup({
	completion = {
		autocomplete = false,
	},
	mapping = {
		['<C-N>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),
		['<C-P>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})

return packer
