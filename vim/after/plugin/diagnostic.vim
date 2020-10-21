let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ''

nnoremap <silent> <leader>dn <cmd>NextDiagnosticCycle<CR>
nnoremap <silent> <leader>dp <cmd>PrevDiagnosticCycle<CR>

call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHint"})
