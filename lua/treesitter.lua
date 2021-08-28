require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "python", "lua", "go"},
  highlight = {
    enable = true,
  }
}
