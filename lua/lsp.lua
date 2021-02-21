local lsp_config = require "lspconfig"
local nvim_completion = require "completion"

lsp_config.tsserver.setup {
    on_attach = nvim_completion.on_attach,
}

lsp_config.gopls.setup {
    on_attach = nvim_completion.on_attach,
}

lsp_config.diagnosticls.setup {
    filetypes = {"javascript", "typescript", "typescriptreact", "javascriptreact"},
    init_options = {
        linters = {
            eslint = {
                command = "eslint_d",
                rootPatterns = {".git"},
                debounce = 100,
                args = {
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json",
                },
                sourceName = "eslint",
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity",
                },
                securities = {
                    -- This seems to be a bug. If I set [2] to "error", then
                    -- all warnings become errors and the [1] is ignored.
                    [2] = "warning",
                    [1] = "warning"
                }
            },
        },
        filetypes = {
            javascript = "eslint",
            typescript = "eslint",
            typescriptreact = "eslint",
            javascriptreact = "eslint",
        },
    },
}


