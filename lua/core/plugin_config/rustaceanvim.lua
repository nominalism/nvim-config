vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      replace_builtin_hover = true,
    },
  },
  server = {
    on_attach = function(client, bufnr)
      -- Ativa os inlay hints nativos do Neovim 0.10
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      -- Mapeamentos de teclas
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", function() vim.cmd.RustLsp("jumpToParentModule") end, opts)
      vim.keymap.set("n", "gd", function() vim.cmd.RustLsp("goToDefinition") end, opts)
      vim.keymap.set("n", "K", function() vim.cmd.RustLsp("hover", "actions") end, opts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "gi", function() vim.cmd.RustLsp("viewImplementations") end, opts)
      vim.keymap.set("n", "<C-k>", function() vim.cmd.RustLsp("signatureHelp") end, opts)
      vim.keymap.set("n", "<leader>D", function() vim.cmd.RustLsp("typeHierarchy") end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.cmd.RustLsp("rename") end, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, opts)
      vim.keymap.set("n", "gr", function() vim.cmd.RustLsp("findReferences") end, opts)
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
      vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, opts)
      vim.keymap.set("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, opts)
      vim.keymap.set("n", "<leader>re", function() vim.cmd.RustLsp("expandMacro") end, opts)
      vim.keymap.set("n", "<leader>rh", function() vim.cmd.RustLsp("hover", "actions") end, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true,
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        assist = {
          importGranularity = "module",
          importPrefix = "by_crate",
        },
        inlayHints = {
          bindingModeHints = {
            enable = true,
          },
          chainingHints = {
            enable = true,
          },
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true,
          },
          parameterHints = {
            enable = true,
          },
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
      },
    },
  },
  dap = {
    -- Configuração opcional para depuração
  },
}
