require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "php", "python" },
  sync_install = false,
  highlight = {
    enable = true
  }
}
