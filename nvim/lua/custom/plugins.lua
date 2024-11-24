local plugins = {
    {
        "nvim-neotest/nvim-nio"
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim"
        },
        ft = {"javascript", "python"},
        opts = function()
            return require "custom.configs.null-ls"
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "black",
                "mypy",
                "ruff",
                "pyright",
                "eslint-lsp",
                "prettier",
                "typescript-language-server",
                "ansible-language-server",
                "stylua"
            }
        }
    },
    {
        "mhartington/formatter.nvim",
        opts = function()
            return require "custom.configs.formatter"
        end
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require "custom.configs.lint"
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }
}
return plugins
