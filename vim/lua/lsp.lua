local completion = require('completion')
local diagnostic = require('diagnostic')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)

  vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

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

nvim_lsp.bashls.setup({
  on_attach = on_attach,
})
nvim_lsp.clangd.setup({
  on_attach = on_attach,
})
nvim_lsp.cmake.setup({
  on_attach = on_attach,
})
nvim_lsp.cssls.setup({
  on_attach = on_attach,
})
nvim_lsp.dockerls.setup({
  on_attach = on_attach,
})
nvim_lsp.html.setup({
  on_attach = on_attach,
})
nvim_lsp.jdtls.setup({
  on_attach = on_attach,
})
nvim_lsp.jsonls.setup({
  on_attach = on_attach,
})
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
})
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
})
nvim_lsp.vimls.setup({
  on_attach = on_attach,
})
nvim_lsp.yamlls.setup({
  on_attach = on_attach,
})
