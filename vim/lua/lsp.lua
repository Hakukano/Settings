local lsp_status = require('lsp-status')
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

local nvim_lsp = require'nvim_lsp'

local on_attach = function(client)
  lsp_status.on_attach(client)
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end

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
