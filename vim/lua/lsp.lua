local completion = require('completion')
local diagnostic = require('diagnostic')
local lsp_status = require('lsp-status')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)

  vim.fn.nvim_set_keymap("n", "<leader>lb", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR><cmd>edit<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>lw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end

lsp_status.register_progress()
lsp_status.config({
  status_symbol = '',
  indicator_errors = '',
  indicator_warnings = '',
  indicator_info = '',
  indicator_hint = '',
  indicator_ok = '✔️',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

nvim_lsp.bashls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.cmake.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.dockerls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.hie.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.jdtls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.vimls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.yamlls.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
