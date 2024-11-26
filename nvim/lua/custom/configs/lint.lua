require("lint").linters_by_ft = {
    javascript = { "eslint" },
    typescript = { "eslint" },
    python = { "pylint", "pydocstyle", "flake8" },
    yaml = { "yamllint" },
    ansible = { "ansible-lint", "yamllint" },
    markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufNewFile", "BufRead" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
