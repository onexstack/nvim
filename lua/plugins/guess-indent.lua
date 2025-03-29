return {
  'nmac427/guess-indent.nvim',
  priority = 1000, -- 确保优先加载
  config = function()
    require('guess-indent').setup {}
  end,
}
