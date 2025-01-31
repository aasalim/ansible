return 
    {
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
            file_types = { 'markdown', 'quarto' },
            opts = {
                render_modes = true

            },
        },
        {
            "tadmccorkle/markdown.nvim",
            ft = "markdown", -- or 'event = "VeryLazy"'
            opts = {
            },
            config = function()
                require("custom.markdown")
            end
        }
    }
