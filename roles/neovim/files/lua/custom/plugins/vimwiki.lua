return {
    -- The plugin location on GitHub
    "vimwiki/vimwiki",
    enabled=true,
    -- The keys that trigger the plugin

    -- The configuration for the plugin
    init = function()
        vim.g.vimwiki_list = {
            {
                -- Here will be the path for your wiki
                path = "~/vimwiki/",
                -- The syntax for the wiki
                syntax = "markdown",
                ext = "md",
            },
        }
        vim.g.vimwiki_global_ext = 0
        --    vim.g.vimwiki_ext2syntax = { }
    end,
    config = function()

    end

}
