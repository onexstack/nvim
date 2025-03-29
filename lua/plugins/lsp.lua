-- plugins/lsp.lua  
return {  
  "neovim/nvim-lspconfig",  
  -- "williamboman/mason.nvim",  
  -- "williamboman/mason-lspconfig.nvim",  
  config = function()  
    local lsp_utils = require("lspconfig.util")  
    -- require("mason").setup()
    -- require("mason-lspconfig").setup()

    -- Go 语言服务器配置  
    require("lspconfig").gopls.setup({  
      cmd = { "gopls", "serve" },  
      root_dir = lsp_utils.root_pattern("go.mod", ".git"),  
      on_attach = function(client, bufnr)  
        -- LSP 附加事件处理（示例配置）  
        -- Enable completion triggered by <c-x><c-o>--
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")  
      end,
      settings = {  
        gopls = {  
          analyses = { unusedparams = true },  
          staticcheck = true,  
          gofumpt = true,
          buildFlags = { "-tags=integration" }  
        }  
      },  
      init_options = {  
        usePlaceholders = true  
      }  
    })  

    -- 自动格式化配置  
    vim.api.nvim_create_autocmd("BufWritePre", {  
      pattern = "*.go",  
      callback = function()  
        vim.lsp.buf.format({  
          async = false,  
          timeout_ms = 5000,  
          filter = function(client)  
            return client.name == "gopls"  
          end  
        })  
      end  
    })  
  end  
}  
