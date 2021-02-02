local completion = require('completion')
local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)

  vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  vim.fn.nvim_set_keymap("n", "<leader>lb", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR><cmd>edit<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lp", "<cmd>lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})

  vim.fn.nvim_set_keymap("n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
  vim.fn.nvim_set_keymap("n", "<leader>dp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true})
end

lspconfig.bashls.setup({
  on_attach = on_attach,
})
lspconfig.clangd.setup({
  on_attach = on_attach,
})
lspconfig.cmake.setup({
  on_attach = on_attach,
})
lspconfig.cssls.setup({
  on_attach = on_attach,
})
lspconfig.dockerls.setup({
  on_attach = on_attach,
})
lspconfig.html.setup({
  on_attach = on_attach,
})
lspconfig.jdtls.setup({
  on_attach = on_attach,
})
lspconfig.jsonls.setup({
  on_attach = on_attach,
})
lspconfig.pyls.setup({
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true,
      },
      diagnostics = {
        enable = true,
        -- disabled = {"unresolved-proc-macro"},
        enableExperimental = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
-- lspconfig.rls.setup({
--   on_attach = on_attach,
-- })
lspconfig.tsserver.setup({
  on_attach = on_attach,
})
lspconfig.vimls.setup({
  on_attach = on_attach,
})
lspconfig.yamlls.setup({
  on_attach = on_attach,
})
