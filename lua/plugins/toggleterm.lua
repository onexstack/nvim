return {  
  "akinsho/toggleterm.nvim",  
  config = function()  
    require("toggleterm").setup({  
      open_mapping = [[<c-\>]],  -- ✅ 快捷键语法正确  
      start_in_insert = true,     -- ⚠️ 这里必须加逗号  
      direction = "float"    -- tab, float, vertical
    })  
  end  
}
