-- LSP diagnostics and code actions
local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    sources = {
      -- formatting
      formatting.prettierd.with {
        extra_filetypes = { "toml" },
        extra_args = {},
        env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
        },
      },
      formatting.eslint_d.with {
        -- for now disable if there is not an eslint file, would like a default
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
        end,
      },
      formatting.black.with { extra_args = {} },
      formatting.stylua,
      formatting.google_java_format,

      -- diagnostics
      diagnostics.flake8,
      diagnostics.eslint_d.with {
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
        end,
      },

      -- code actions
      code_actions.eslint_d.with {
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
        end,
      },
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
  }
end

return M
