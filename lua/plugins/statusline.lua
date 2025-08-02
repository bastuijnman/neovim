return {

    {
        "beauwilliams/statusline.lua",
        dependencies = {
            "nvim-lua/lsp-status.nvim"
        },
        config = function () 
            require("statusline").setup({})
        end
    }

}
