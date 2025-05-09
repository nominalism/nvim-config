-- lua/core/plugin_config/conform.lua
local conform = require("conform")

conform.setup({
  formatters = {
    ["zig fmt"] = {
      command = "zig",
      args = { "fmt", "--stdin" },
      stdin = true,
    }
  },
  formatters_by_ft = {
    go              = { "gofmt" },
    lua             = { "stylua" },
    javascript      = { "prettier" },
    typescript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte          = { "prettier" },
    css             = { "prettier" },
    html            = { "prettier" },
    json            = { "prettier" },
    yaml            = { "prettier" },
    markdown        = { "prettier" },
    rust            = { "rustfmt" },
    python          = { "black" },
    zig             = { "zig fmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = false,
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
