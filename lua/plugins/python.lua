return {
  -- LSP for Python
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "strict", -- Enforces strict typing
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },

  -- Mason: Manage external tools like formatters, linters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", -- LSP for Python
        "ruff", -- Linter for Python
        "black", -- Python formatter
        "isort", -- Sort imports
      },
    },
  },

  -- Null-ls: Integrates formatters/linters
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
       -- Ensure `opts.sources` is initialized as a table
      opts.sources = opts.sources or {}

      table.insert(opts.sources, null_ls.builtins.formatting.black)
      table.insert(opts.sources, null_ls.builtins.formatting.isort)
      table.insert(opts.sources, null_ls.builtins.diagnostics.ruff)
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      })
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "json",
        "yaml",
      },
    },
  },
}

