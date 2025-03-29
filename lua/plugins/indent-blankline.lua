return {  
  "lukas-reineke/indent-blankline.nvim",  
  main = "ibl",  
  event = "VeryLazy", -- 确保插件延迟加载  
  config = function() -- 所有配置必须在此函数内执行  
    -- 全局状态标记（可选改用vim.b本地缓存）  
    vim.g.indent_blankline_visible = false -- 默认关闭  

    -- 定义切换函数（需要局部函数确保作用域隔离）  
    local function toggle_indent_lines()  
      vim.g.indent_blankline_visible = not vim.g.indent_blankline_visible  
      require("ibl").setup({ -- 需使用插件主模块'ibl'  
        enabled = true,  
        indent = {  
          char = vim.g.indent_blankline_visible and "│" or ""  
        },  
        scope = {  
          show_start = vim.g.indent_blankline_visible,  
          show_end = vim.g.indent_blankline_visible  
        }  
      })  
      vim.cmd("redraw!")  
    end  

    -- 设置快捷键（确保在插件加载后调用）  
    vim.keymap.set("n", "<leader>il", toggle_indent_lines, {  
      desc = "Toggle indent guides"  
    })  

    -- 初始化配置，根据全局变量决定是否显示缩进线  
    require("ibl").setup({  
      indent = { char = vim.g.indent_blankline_visible and "│" or "" },  
      scope = { show_start = vim.g.indent_blankline_visible, show_end = vim.g.indent_blankline_visible }  
    })  
  end  
}  
