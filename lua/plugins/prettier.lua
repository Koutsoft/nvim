return{
    {"stevearc/conform.nvim",
    event = {"BufReadPre","BufNewFile"},
    config = function ()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                java = { "google-java-format" },
                markdown = { "prettier" },
                lua = {"stylua"},

            },
            formart_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            }
        })
        vim.keymap.set({
            "n", "v"
        }, "<leader>mp",function ()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            })
        end, {desc = "Formart file or range(in visual mode)"})
    end,

    }
}
