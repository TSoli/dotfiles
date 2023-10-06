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

-- local file_exists = function(file)
--   local f = io.open(file, "r")
--   if f ~= nil then io.close(f) return true else return false end
-- end

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = false,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false, timeout_ms = 8000 })
          end,
        })
      end
    end,
    sources = {
      -- formatting
      formatting.prettierd.with {
        extra_filetypes = { "toml" },
        extra_args = {},
        env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
        },
      },
      -- use eslint lsp server instead
      -- formatting.eslint_d.with {
      --   condition = function(utils)
      --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
      --   end,
      --   -- extra_args = function(params)
      --   --   local file_types = {"js", "cjs", "yaml", "yml", "json"}
      --   --   for _, file_type in pairs(file_types) do
      --   --     if file_exists(params.root .. '/.eslintrc.' .. file_type) then
      --   --       return {}
      --   --     end
      --   --   end
      --   --
      --   --   return {
      --   --     "--config",
      --   --     vim.fn.expand('~/.config/nvim/utils/linter-config/.eslintrc.js')
      --   --   }
      --   -- end,
      -- },
      formatting.black.with { extra_args = {} },
      formatting.isort,
      formatting.stylua,
      formatting.google_java_format,
      formatting.latexindent.with({
        filetypes = { "tex", "sty", "cls" },
        args = { "-m" },  -- allows latexindent to modify linebreaks
      }),

      -- diagnostics
      diagnostics.flake8,
      -- diagnostics.eslint_d.with {
      --   condition = function(utils)
      --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
      --   end,
      -- },

      -- code actions
      -- code_actions.eslint_d.with {
      --   condition = function(utils)
      --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslint.yaml", ".eslint.yml", ".eslintrc.json" })
      --   end,
      -- },
    }
  }
end

return M
