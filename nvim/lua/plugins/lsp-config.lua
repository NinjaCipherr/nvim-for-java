
return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with default properties
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript language server, java language server, c language server, go language server, html/css language servers, python lsp server, and tailwindcss lsp server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "lua_ls", "tsserver", "jdtls", "clangd", "gopls", "html", "cssls", "pyright", "tailwindcss" 
                },
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter, other debuggers, and Python debugger are installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test", "codelldb", "python" }
            })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local jdtls = require('jdtls')

            -- Define workspace directory
            local home = os.getenv("HOME")
            local workspace_dir = home .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

            -- JDTLS configuration
            local config = {
                cmd = {
                    'java',
                    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                    '-Dosgi.bundles.defaultStartLevel=4',
                    '-Declipse.product=org.eclipse.jdt.ls.core.product',
                    '-Dlog.protocol=true',
                    '-Dlog.level=ALL',
                    '-Xms1g',
                    '--add-modules=ALL-SYSTEM',
                    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                    '-jar', vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
                    '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
                    '-data', workspace_dir
                },
                root_dir = require('jdtls.setup').find_root({'pom.xml', '.git', 'mvnw', 'gradlew'}),
                settings = {
                    java = {}
                },
                init_options = {
                    bundles = {}
                },
            }

            jdtls.start_or_attach(config)
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- setup the lua language server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- setup the typescript language server
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            -- setup the clangd language server for C/C++
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            -- setup the gopls language server for Go
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- setup the html language server for HTML
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            -- setup the cssls language server for CSS
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            -- setup the python language server
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            -- setup the tailwindcss language server
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            -- Set vim motions for LSP functions
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end
    }
}
