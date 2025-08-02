local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach_lsp = function(client, buffer)
    local opts = function(desc)
        return { buffer = buffer, desc = desc }
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts("Format buffer"))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    vim.keymap.set("n", "<leader>cp", vim.lsp.buf.hover, opts("Code problems"))
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = buffer,
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end

    vim.diagnostic.config({ virtual_text = true })
end

return {


    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    "gopls",
                    "phpactor"
                },
                automatic_enable = false,
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ on_attach = on_attach_lsp })
            lspconfig.rust_analyzer.setup({ on_attach = on_attach_lsp })
            lspconfig.ts_ls.setup({ on_attach = on_attach_lsp })
            lspconfig.gopls.setup({ on_attach = on_attach_lsp })
            lspconfig.phpactor.setup({ on_attach = on_attach_lsp })
        end
    },

}
