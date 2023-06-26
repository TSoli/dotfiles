-- LSP
local M = {
  "neovim/nvim-lspconfig",  --enable cmp
  lazy = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

function M.config()
  local cmp_nvim_lsp = require "cmp_nvim_lsp"

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  local function lsp_keymaps(bufnr)
    local keymap = vim.api.nvim_buf_set_keymap
    local maps = {
      { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP: Go to declaration" },
      { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP: Go to definition" },
      { "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP: Show hover" },
      { "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP: Go to implementation" },
      { "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "LSP: Go to references" },
      { "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "LSP: Open diagnostic float" },
      { "n", "<leader>li", "<cmd>LspInfo<cr>", "LSP info pane" },
      { "n", "<leader>lI", "<cmd>Mason<cr>", "Mason info pane" },
      { "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP: Code actions" },
      -- { "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "" },
      -- { "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "" },
      { "n", "gp", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "LSP: Go to next diagnostic" },
      { "n", "gP", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "LSP: Go to previous diagnostic" },
      { "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP: Rename all references" },
      { "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP: Signature help" },
      { "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", "LSP: Open diagnostics in location list" },
    }

    for _, map in ipairs(maps) do
      local mode, bind, cmd, description = unpack(map)
      keymap(bufnr, mode, bind, cmd, { noremap = true, silent = true, desc = description })
    end
  end

  local lspconfig = require "lspconfig"
  local on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    require("illuminate").on_attach(client)
  end

  for _, server in pairs(require("utils").servers) do
    Opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "settings." .. server)
    if require_ok then
      Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
    end

    lspconfig[server].setup(Opts)
  end

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
  }

  vim.diagnostic.config(config)

  -- use noice instead
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  -- })
  --
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  --   border = "rounded",
  -- })
end

return M
