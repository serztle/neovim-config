local function ts_disable(_, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 5000
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "rust", "php", "python", "latex", "bibtex", "javascript", "go"},
  sync_install = false,
  highlight = {
    enable = true,
    disable = function(lang, bufnr)
        return lang == "javascript" or ts_disable(lang, bufnr)
    end,
  },
}
