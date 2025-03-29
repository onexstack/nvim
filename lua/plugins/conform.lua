return {  
  'stevearc/conform.nvim',  
  opts = {},  
  config = function()  
    require("conform").setup({  
      formatters_by_ft = {  
        -- go = { "goimports", "gofmt" },
        go = { "goimports", "gofmt" },
        lua = { "stylua" },  
        python = { "isort", "black" },  
        rust = { "rustfmt", lsp_format = "fallback" },  
        javascript = { "prettierd", "prettier", stop_after_first = true }  
      }  
    })  
  end  
}  
