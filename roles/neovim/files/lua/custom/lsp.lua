
local servers = {
  "lua_ls",
}
require('mason-tool-installer').setup { ensure_installed = servers }
require("mason").setup()
require('mason-lspconfig').setup {
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      require('lspconfig')[server_name].setup(server)
    end
  },
}
