if not pcall(require, "go") then
  return
end

require("go").setup({
  --goimport = 'goimports', -- 'gopls'
  fillstruct = "gopls",
  --log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
  lsp_codelens = false, -- use navigator
  dap_debug = true,
  goimport = "gopls",
  dap_debug_vt = true,
  dap_debug_gui = true,
  test_runner = "go", -- richgo, go test, richgo, dlv, ginkgo
  -- run_in_floaterm = true, -- set to true to run in float window.
  lsp_document_formatting = false,
  luasnip = true,
  -- lsp_on_attach = require("navigator.lspclient.attach").on_attach,
  -- lsp_cfg = true,
  -- test_efm = true, -- errorfomat for quickfix, default mix mode, set to true will be efm only
  --
  verbose = false, -- output loginf in messages

  -- true: will use go.nvim on_attach if true
  -- nil/false do nothing
  -- lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug_keymap = false, -- set keymaps for debugger

  -- Disable everything for LSP
  lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
  gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
})

vim.defer_fn(function()
  vim.cmd("augroup go")
  vim.cmd("autocmd!")
  vim.cmd("autocmd FileType go nmap <leader>gb  :GoBuild")
  --  Show by default 4 spaces for a tab')
  vim.cmd("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4")
  --  :GoBuild and :GoTestCompile')
  -- vim.cmd('autocmd FileType go nmap <leader><leader>gb :<C-u>call <SID>build_go_files()<CR>')
  --  :GoTest')
  vim.cmd("autocmd FileType go nmap <leader>gt  GoTest")
  --  :GoRun

  vim.cmd("autocmd FileType go nmap <Leader>l GoLint")
  vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")

  vim.cmd("au FileType go command! Gtn :TestNearest -v -tags=integration")
  vim.cmd("au FileType go command! Gts :TestSuite -v -tags=integration")
  vim.cmd("ab dt GoDebug -t")
  vim.cmd("augroup END")
end, 1)
