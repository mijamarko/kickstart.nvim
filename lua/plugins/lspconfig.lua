return {
   {
     'neovim/nvim-lspconfig',
     dependencies = {
       'williamboman/mason.nvim',
       'williamboman/mason-lspconfig.nvim',
       'folke/neodev.nvim',
     },
     config = function ()
         local on_attach = function(_, bufnr)
             local nmap = function(keys, func, desc)
                 if desc then
                     desc = 'LSP: ' .. desc
                 end
                 vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
             end

             local builtin = require('telescope.builtin')
             nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
             nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
             nmap('gd', builtin.lsp_definitions, 'Goto Definition')
             nmap('gr', builtin.lsp_references, 'Goto References')
             nmap('gi', builtin.lsp_implementations, 'Goto Implementations')
             nmap('<leader>D', builtin.lsp_type_definitions, 'Type Definition')
             nmap('<leader>ds', builtin.lsp_document_symbols, 'Document Symbols')
             nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
             nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
             nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
         end
         require('mason').setup()
         require('mason-lspconfig').setup()

         local servers = {
             html = { filetypes = {'html', 'twig', 'hbs'} },
             gopls = {},
             tsserver = {},
             lua_ls = {
                 Lua = {
                     workspace = { checkThirdParty = false },
                     telemetry = { enable = false },
                 },
             },
             clojure_lsp = {},
         }
         require('neodev').setup()
         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

         local mason_lspconfig = require 'mason-lspconfig'

         mason_lspconfig.setup {
             ensure_installed = vim.tbl_keys(servers),
         }

         mason_lspconfig.setup_handlers {
             function(server_name)
                 require('lspconfig')[server_name].setup {
                     capabilities = capabilities,
                     on_attach = on_attach,
                     settings = servers[server_name],
                     filetypes = (servers[server_name] or {}).filetypes,
                 }
             end,
         }
     end
   }
}
