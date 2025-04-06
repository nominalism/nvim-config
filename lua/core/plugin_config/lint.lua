-- lua/core/plugin_config/lint.lua
local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint_d" }, -- Use eslint_d for better performance
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  python = { "flake8" }, -- Example for Python
  -- Add other filetypes and linters as needed
}

-- Configure linting to run on specific events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
