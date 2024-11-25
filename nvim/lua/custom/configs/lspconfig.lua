local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local servers = {
    "pyright",
    "ansiblels",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "html",
    "yamlls",
    "ts_ls"
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(
        {
            on_attach = on_attach,
            capabilities = capabilities
        }
    )
end
