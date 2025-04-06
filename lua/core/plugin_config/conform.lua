-- lua/core/plugin_config/conform.lua
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    rust = { "rustfmt" },
    python = { "black" }, -- Example for Python
    -- Add other filetypes and formatters as needed
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true, -- Fallback to LSP formatting if conform formatter fails
  },
})

-- Add keymap for manual formatting (optional)
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer with Conform" })

-- Explicitly define format on save via autocmd
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", -- Run for all file types conform can handle
  callback = function(args)
    require("conform").format({ bufnr = args.buf, async = true, lsp_fallback = true })
  end,
  group = vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true }),
  desc = "Format buffer before saving using conform.nvim",
})
