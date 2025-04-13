require('telescope').setup({ 
  file_ignore_patterns = { "node%_modules/.*" },
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.45,
      },
      width = 0.90,
      height = 0.90,
      preview_cutoff = 120,
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    prompt_prefix = "   ",
    selection_caret = "  ",
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
      },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          preview_width = 0.55,
        },
        width = 0.90,
        height = 0.90,
      },
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  },
})

local builtin = require('telescope.builtin')

require("telescope").load_extension "file_browser"
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Space>fb', ":Telescope file_browser<CR>", { noremap = true })
