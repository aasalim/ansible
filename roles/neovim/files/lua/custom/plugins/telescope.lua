
-- _____    _                                
--|_   _|__| | ___  ___  ___ ___  _ __   ___ 
--  | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--  | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--  |_|\___|_|\___||___/\___\___/| .__/ \___|
--                               |_|         
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("custom.telescope")
    end
}
