return {  
  "ray-x/go.nvim",  
  dependencies = {  -- 依赖项修正  
    "ray-x/guihua.lua",  
    "neovim/nvim-lspconfig",  
    "nvim-treesitter/nvim-treesitter",  
  },  
  event = { "CmdlineEnter" },  
  ft = { "go", "gomod" },  
  build = function()  -- 修正构建命令  
    require("go.install").update_all_sync()  
  end,  
  config = function()  
    require("go").setup({
      verbose = false,
      diagnostic = {  -- set diagnostic to false to disable vim.diagnostic.config setup,
        -- true: default nvim setup
        hdlr = false, -- hook lsp diag handler and send diag to quickfix
        underline = true,
        virtual_text = { spacing = 2, prefix = '' }, -- virtual text setup
        signs = {'', '', '', ''},  -- set to true to use default signs, an array of 4 to specify custom signs
        update_in_insert = false,
      },
      dap_debug = false,

    })  
    -- require("go.format").gofmt()  -- 只使用 gofmt  
    require("go.format").goimports()  -- goimports + gofmt

    -- 自动格式化配置 (修正缩进和语法)  
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})  
    vim.api.nvim_create_autocmd("BufWritePre", {  
      pattern = "*.go",  
      group = format_sync_grp,  
      callback = function()  
        -- require("go.format").gofmt()  
        require("go.format").goimports()  -- goimports + gofmt
      end,  
    })  
  end  
}  
