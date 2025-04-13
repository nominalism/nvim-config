-- lua/core/plugin_config/lint.lua
local lint = require("lint")

-- Define o comando do golangci-lint explicitamente
lint.linters.golangci_lint = {
  cmd = vim.fn.stdpath("data") .. "/mason/bin/golangci-lint",
  args = {"run", "--out-format=json"},
  stdin = false,
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output, bufnr)
    if output == "" then
      return {}
    end
    
    local diagnostics = {}
    local decoded = vim.json.decode(output)
    
    if not decoded or not decoded.Issues then
      return {}
    end
    
    for _, issue in ipairs(decoded.Issues) do
      local severity = vim.diagnostic.severity.WARN
      if issue.Severity == "error" then
        severity = vim.diagnostic.severity.ERROR
      end
      
      table.insert(diagnostics, {
        source = "golangci-lint",
        lnum = issue.Pos.Line - 1,
        col = issue.Pos.Column - 1,
        end_lnum = issue.Pos.Line - 1,
        end_col = issue.Pos.Column - 1,
        severity = severity,
        message = issue.Text,
      })
    end
    
    return diagnostics
  end
}

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },
  python = { "flake8" },
  go = { "golangci_lint" },  -- Corrigido para usar o nome interno correto (com underscore)
}

-- Configure linting to run on specific events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint-autogroup", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
