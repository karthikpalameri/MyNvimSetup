-- return {
--   -- add dracula
--   {
--     "Mofiqul/dracula.nvim" ,
--     lazy = false,
--     priority = 1000,
--
--    config = function()
--       -- load the colorscheme here
--       vim.cmd([[colorscheme dracula]])
--    end,
--   }
-- }
return {
    -- Dracula theme
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
    },

    -- tokyo night theme (set as default at startup)
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local theme_name = "tokyonight-night"
            -- set this as the default theme
            print ("enabling this : ".. theme_name .." theme from the plugins.colorscheme.lua ...")
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    --Rose Pine Theme
    { 
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     -- set this as the default theme
        --     print ("enabling this theme from the plugins.colorscheme.lua ...")
        --     vim.cmd([[colorscheme rose-pine-main]])
        -- end,
    }
}
