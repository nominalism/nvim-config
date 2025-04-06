require("mason").setup({
  ensure_installed = {
    -- Formatters for conform.nvim
    "stylua",       -- Lua
    "prettier",     -- JS, TS, CSS, HTML, JSON, YAML, Markdown
    "rustfmt",      -- Rust
    "black",        -- Python (Example)

    -- Linters for nvim-lint
    "eslint_d",     -- JS/TS Linter (Daemonized)
    "flake8",       -- Python Linter (Example)

    -- LSPs (Keep these from lsp_config or add them here if preferred)
    -- "rust_analyzer",
    -- "ts_ls",
    -- "lua_ls",
  }
})
