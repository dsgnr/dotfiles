local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        require("none-ls.diagnostics.eslint_d").with(
            {
                diagnostics_format = "[eslint] #{m}\n(#{c})",
                condition = function(utils)
                    return utils.root_has_file(
                        {
                            ".eslintrc",
                            ".eslintrc.js",
                            ".eslintrc.cjs",
                            ".eslintrc.yaml",
                            ".eslintrc.yml",
                            ".eslintrc.json"
                        }
                    )
                end
            }
        ),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.mypy.with(
            {
                -- see issue https://github.com/nvimtools/none-ls.nvim/issues/97
                args = function(params)
                    return {
                        "--hide-error-codes",
                        "--hide-error-context",
                        "--no-color-output",
                        "--show-absolute-path",
                        "--show-column-numbers",
                        "--show-error-codes",
                        "--no-error-summary",
                        "--no-pretty",
                        "--install-types",
                        "--python-executable",
                        (os.getenv("VIRTUAL_ENV") or "") .. "/bin/python",
                        params.temp_path
                    }
                end,
                on_output = function(line, params)
                    line = line:gsub(params.temp_path:gsub("([^%w])", "%%%1"), params.bufname)
                    return null_ls.builtins.diagnostics.mypy._opts.on_output(line, params)
                end
            }
        )
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds(
                {
                    group = augroup,
                    buffer = bufnr
                }
            )
            vim.api.nvim_create_autocmd(
                "BufWritePre",
                {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({bufnr = bufnr})
                    end
                }
            )
        end
    end
}
return opts
