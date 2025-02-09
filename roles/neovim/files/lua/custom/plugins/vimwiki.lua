return {
  enabled = true,
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        -- Here will be the path for your wiki
        path = "~/backups/vimwiki/",
        -- The syntax for the wiki
        syntax = "markdown",
        ext = "md",
      },
    }
    vim.g.vimwiki_global_ext = 0
    -- vim.g.vimwiki_ext2syntax = { }
  end,
  config = function()

  end

}
