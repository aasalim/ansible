return {
    enabled = true,
    'stevearc/oil.nvim',
    dependencies = { "echasnovski/mini.icons" },
    config = function()
    require("custom.file_explorer")
    end
}
