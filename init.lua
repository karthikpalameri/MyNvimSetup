print('Loading init.lua...')

print('Loading lazy.nvim...')

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


-- Load the options from the config/options.lua file
require("config.options")
-- Load the keymaps from the config/keymaps.lua file
require("config.keymaps")

print('Setting up lazy.nvim...')
-- Reference : https://lazy.folke.io/installation 

-- Declare a few options for lazy
local opts = {
    change_detection = {
        -- Don't notify us every time a change is made to the configuration
        notify = false,
    },
    checker = {
        -- Automatically check for package updates
        enabled = true,
        -- Don't spam us with notification every time there is an update available
        notify = false,
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        -- colorscheme = { "dracula" },
    },
}

require("lazy").setup("plugins", opts)

