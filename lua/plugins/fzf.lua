return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "VeryLazy" },
    opts = {
        "default",
        winopts = {
            preview = {
                default = "builtin",
                hidden = true, -- 关闭文件预览
                border = "noborder",
                vertical = "up:50%",
                horizontal = "right:50%",
                delay = 20,
            },
        },
        files = {
            formatter = "path.filename_first",
            path_shorten = 2,
        },
        diagnostics = {
            split = "belowright new",
        },
        previewers = {
            cat = {
                cmd             = "cat",
                args            = "-n",
            },
            bat = {
                cmd             = "bat",
                args            = "--color=always --style=numbers,changes",
            },
            head = {
                cmd             = "head",
                args            = nil,
            },
            git_diff = {
                -- if required, use `{file}` for argument positioning
                -- e.g. `cmd_modified = "git diff --color HEAD {file} | cut -c -30"`
                cmd_deleted     = "git diff --color HEAD --",
                cmd_modified    = "git diff --color HEAD",
                cmd_untracked   = "git diff --color --no-index /dev/null",
                -- git-delta is automatically detected as pager, set `pager=false`
                -- to disable, can also be set under 'git.status.preview_pager'
            },
            man = {
                -- NOTE: remove the `-c` flag when using man-db
                -- replace with `man -P cat %s | col -bx` on OSX
                cmd             = "man -c %s | col -bx",
            },
            builtin = {
                syntax          = true,         -- preview syntax highlight?
                syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
                syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
                limit_b         = 1024*1024*10, -- preview limit (bytes), 0=nolimit
                -- previewer treesitter options:
                -- enable specific filetypes with: `{ enabled = { "lua" } }
                -- exclude specific filetypes with: `{ disabled = { "lua" } }
                -- disable `nvim-treesitter-context` with `context = false`
                -- disable fully with: `treesitter = false` or `{ enabled = false }`
                treesitter      = {
                    enabled = true,
                    disabled = {},
                    -- nvim-treesitter-context config options
                    context = { max_lines = 1, trim_scope = "inner" }
                },
                -- By default, the main window dimensions are calculated as if the
                -- preview is visible, when hidden the main window will extend to
                -- full size. Set the below to "extend" to prevent the main window
                -- from being modified when toggling the preview.
                toggle_behavior = "default",
                -- Title transform function, by default only displays the tail
                -- title_fnamemodify = function(s) vim.fn.fnamemodify(s, ":t") end,
                -- preview extensions using a custom shell command:
                -- for example, use `viu` for image previews
                -- will do nothing if `viu` isn't executable
                extensions      = {
                    -- neovim terminal only supports `viu` block output
                    ["png"]       = { "viu", "-b" },
                    -- by default the filename is added as last argument
                    -- if required, use `{file}` for argument positioning
                    ["svg"]       = { "chafa", "{file}" },
                    ["jpg"]       = { "ueberzug" },
                },
                -- if using `ueberzug` in the above extensions map
                -- set the default image scaler, possible scalers:
                --   false (none), "crop", "distort", "fit_contain",
                --   "contain", "forced_cover", "cover"
                -- https://github.com/seebye/ueberzug
                ueberzug_scaler = "cover",
                -- Custom filetype autocmds aren't triggered on
                -- the preview buffer, define them here instead
                -- ext_ft_override = { ["ksql"] = "sql", ... },
                -- render_markdown.nvim integration, enabled by default for markdown
                render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
            },
            -- Code Action previewers, default is "codeaction" (set via `lsp.code_actions.previewer`)
            -- "codeaction_native" uses fzf's native previewer, recommended when combined with git-delta
            codeaction = {
                -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
                diff_opts = { ctxlen = 3 },
            },
            codeaction_native = {
                diff_opts = { ctxlen = 3 },
                -- git-delta is automatically detected as pager, set `pager=false`
                -- to disable, can also be set under 'lsp.code_actions.preview_pager'
                -- recommended styling for delta
                --pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
            },
        }
    },
    keys = {
        -- { "<leader>r", "<cmd>FzfLua buffers<CR>", desc = "buffers" },
        -- { "<leader>k", "<cmd>FzfLua files<CR>", desc = "files" },
        -- { "<leader>f", "<cmd>FzfLua <CR>", desc = "FzfLua self" },
        -- { "<leader>r", "<cmd>FzfLua buffers<CR>", desc = "buffers" },
        -- { "<leader>k", "<cmd>FzfLua files<CR>", desc = "files" },
        -- { "<leader>f", "<cmd>FzfLua live_grep<CR>", desc = "live grep" },
        -- { "<C-f>", "<cmd>FzfLua grep_curbuf<CR>", desc = "lines" },
        -- { "<leader>f", "<cmd>FzfLua <CR>", desc = "FzfLua self" },

        --- { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "help" },
        -- { "<leader>fH", "<cmd>FzfLua highlights<CR>", desc = "highlights" },
        -- { "<leader>fm", "<cmd>FzfLua oldfiles<CR>", desc = "mru" }, -- mru: most recent used
        -- { "<leader>fc", "<cmd>FzfLua commands<CR>", desc = "commands" },
        -- { "<leader>fj", "<cmd>FzfLua jumps<CR>", desc = "jumplist" },
        -- { "<leader>fk", "<cmd>FzfLua keymaps<CR>", desc = "keymaps" },
        -- { "<leader>fq", "<cmd>FzfLua quickfix<CR>", desc = "quickfix" },
        -- { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "cword" },
        -- { "<leader>fa", "<cmd>lua require('helper.asynctask').fzf_select()<CR>", desc = "asynctask" },

        -- { "<leader>d", "<cmd>FzfLua lsp_document_diagnostics<CR>", desc = "lsp_document_diagnostics" },
        -- { "<leader>fd", "<cmd>FzfLua lsp_definitions<CR>", desc = "lsp_definition" },
        -- { "<leader>fr", "<cmd>FzfLua lsp_references<CR>", desc = "lsp_references" },
        -- { "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", desc = "lsp_implementations" },
        -- { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "lsp_document_symbols" },
        -- { "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", desc = "lsp_workspace_symbols" },

    },
}
