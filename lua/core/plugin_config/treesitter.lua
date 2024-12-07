require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "hoon" },  
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
}
