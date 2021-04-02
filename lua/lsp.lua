local lsp_config = require "lspconfig"
local nvim_completion = require "completion"

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    nvim_completion.on_attach(client)
end

-- Typescript/Javascript
lsp_config.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end
}

-- Go
lsp_config.gopls.setup {
    on_attach = on_attach
}

-- Elm
-- npm install -g @elm-tooling/elm-language-server
lsp_config.elmls.setup {
    on_attach = on_attach
}

require("formatter").setup(
    {
        logging = false,
        filetype = {
            -- typescript/javascript
            -- Install prettier in project
            typescript = {
                function()
                    return {
                        exe = "./node_modules/.bin/prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            typescriptreact = {
                function()
                    return {
                        exe = "./node_modules/.bin/prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            javascript = {
                function()
                    return {
                        exe = "./node_modules/.bin/prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            javascriptreact = {
                function()
                    return {
                        exe = "./node_modules/.bin/prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            -- go
            -- goreturns included when installing go
            go = {
                function()
                    return {
                        exe = "goreturns",
                        args = {},
                        stdin = true
                    }
                end
            },
            -- lua
            -- `npm install -g lua-fmt`
            lua = {
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            },
            -- elm
            -- `npm install -g elm-format
            elm = {
                function()
                    return {
                        exe = "elm-format",
                        args = {"--stdin"},
                        stdin = true
                    }
                end
            }
        }
    }
)

vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.go,*.lua,*.elm FormatWrite
augroup END
]],
    true
)

-- lsp_config.diagnosticls.setup {
--     filetypes = {"javascript", "typescript", "typescriptreact", "javascriptreact"},
--     init_options = {
--         linters = {
--             eslint = {
--                 command = "eslint_d",
--                 rootPatterns = {".git"},
--                 debounce = 100,
--                 args = {
--                     "--stdin",
--                     "--stdin-filename",
--                     "%filepath",
--                     "--format",
--                     "json",
--                 },
--                 sourceName = "eslint",
--                 parseJson = {
--                     errorsRoot = "[0].messages",
--                     line = "line",
--                     column = "column",
--                     endLine = "endLine",
--                     endColumn = "endColumn",
--                     message = "${message} [${ruleId}]",
--                     security = "severity",
--                 },
--                 securities = {
--                     -- This seems to be a bug. If I set [2] to "error", then
--                     -- all warnings become errors and the [1] is ignored.
--                     [2] = "warning",
--                     [1] = "warning"
--                 }
--             },
--         },
--         filetypes = {
--             javascript = "eslint",
--             typescript = "eslint",
--             typescriptreact = "eslint",
--             javascriptreact = "eslint",
--         },
--     },
-- }
--
