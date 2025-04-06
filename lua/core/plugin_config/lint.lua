-- lua/core/plugin_config/lint.lua
local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" }, 
  python = { "flake8" },
  rust = { "clippy" }, 
  go = { "golangci-lint" }, 
} 

-- Configure linting to run on specific events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
