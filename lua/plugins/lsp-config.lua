return{

    -- mason.nvim - Manage language servers.
    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup()
        end
    },
    -- mason-lspconfig.nvim - Set up language servers automatically.
    -- mason-lspconfig.nvim: Helps install LSP servers for nvim-lspconfig. make it dependent by saying, dependencies = { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls" },
            })
        end
    },


    -- mason-nvim-dap: Helps install debuggers for nvim-dap.
    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
                automatic_installation = true,

            })
        end
    },

    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },
    -- nvim-lspconfig - Configure the language servers.
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- get access to the lspconfig plugins functions
            local lspconfig = require("lspconfig")

            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- setup the lua language server
            lspconfig.lua_ls.setup({
                -- capabilities = capabilities,
            })

            -- -- setup the typescript language server
            -- lspconfig.tsserver.setup({
            --     capabilities = capabilities,
            -- })

            -- Advance usage without attaching to telescope
            -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- Set vim motion for <Space> + c + r to display references to the code under the cursor
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
            -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
            -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

            -- Basic useage without attaching to telescope
            -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
            -- vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
            -- vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            -- -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- -- Set vim motion for <Space> + c + r to display references to the code under the cursor (without Telescope)
            -- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "[C]ode Goto [R]eferences" })
            -- -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor (without Telescope)
            -- vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "[C]ode Goto [I]mplementations" })
            -- -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
            -- vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
            -- vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end
    }
}
