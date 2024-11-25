local opts = {
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
    },
}
return opts
