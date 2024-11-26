local plugins = {
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
            "BufRead",
        },
        config = function()
            require "custom.configs.lint"
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
                "pylint",
                "eslint-lsp",
                "shellcheck",
                "prettier",
                "pydocstyle",
                "flake8",
                "yamllint",
                "htmlhint",
                "typescript-language-server",
                "ansible-language-server",
                "yaml-language-server",
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
