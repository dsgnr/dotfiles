local plugins = {
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = function()
            return require "custom.configs.conform"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "black",
                "isort",
                "mypy --install-types",
                "pyright",
                "eslint-lsp",
                "prettier",
                "typescript-language-server",
                "ansible-language-server",
                "stylua",
                "lua-language-server",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
}
return plugins
