return{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        'HiPhish/rainbow-delimiters.nvim',
        'windwp/nvim-ts-autotag'
    },
    config = function()
        --gain access to the tree sitter connfigs function
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            -- make sure we have vim, vimdoc, lua, java, javascript, typescript, html, css, json, tsx, markdown, markdown, inline markdown and gitignore highlighting servers
            ensure_installed = {
                "vim", "vimdoc", "lua", "java", "javascript", 
                "typescript", "html", "css", "json", "tsx", 
                "markdown", "markdown_inline", "gitignore"
            },
            highlight = {
                enable = true, -- Enable syntax highlighting
            },
            indent = {
                enable = true -- Enable indentation expiremental
            },
            rainbow = {
                enable = true,
                -- -- list of languages you want to disable the plugin for
                -- disable = { 'jsx', 'cpp' },
                -- -- Which query to use for finding delimiters
                -- query = 'rainbow-parens',
                -- -- Highlight the entire buffer all at once
                -- strategy = require('ts-rainbow').strategy.global,
            }
        })
        print("config.treesitter setup called...")  -- Print after the setup to confirm it's called

        -- Setup treesitter-context
        local ts_context = require("treesitter-context")
        ts_context.setup({
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        })
        print("config.treesitter-context setup called...")  -- Print after setup to confirm

        -- Setup rainbow brackets 
        require('rainbow-delimiters.setup').setup ({})
        print("config.treesitter-rainbow setup called...")  -- Print after setup to confirm

        --Setup autotag 
        require('nvim-ts-autotag').setup({
            opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = true -- Auto close on trailing </
            },
            -- Also override individual filetype configs, these take priority.
            -- Empty by default, useful if one of the "opts" global settings
            -- doesn't work well in a specific filetype
            -- per_filetype = {
            --     ["html"] = {
            --         enable_close = false
            --     }
            -- }
        })
        print("config.treesitter-autotag setup called...")
        
    end
}
