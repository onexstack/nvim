-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- { import = "plugins" },
    { import = "plugins/alpha" },   
    -- { import = "plugins/catppuccin" }, 
    { import = "plugins/gruvbox" },   
    { import = "plugins/conform" },    
    { import = "plugins/gitsigns" },  
    { import = "plugins/indent-blankline" }, 
    { import = "plugins/lualine" },   
    { import = "plugins/toggleterm" },
    { import = "plugins/treesitter" },
    { import = "plugins/autopairs" }, 
    { import = "plugins/cmp" },   
    -- { import = "plugins/markdown" }, 
    -- { import = "plugins/neo-tree" }, 
    { import = "plugins/tokyonight" }, 
    { import = "plugins/which-key" }, 
    { import = "plugins/guess-indent" },
    --{ import = "plugins/lspconfig" }, 
    -- { import = "plugins/mason" },
    { import = "plugins/lsp" },  
    { import = "plugins/fzf" },  
    { import = "plugins/go-vim" }, 
    { import = "plugins/comment" }, 
    { import = "plugins/notify" },
    -- { import = "plugins/avante" }, 
    { import = "plugins/root" },   
    -- { import = "plugins/blame" },   
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { 
    enabled = false,    -- 完全禁用更新检查  
    notify = false      -- 关闭所有通知
    -- frequency = 604800  -- 检查间隔改为每周一次（单位：秒）
  },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
