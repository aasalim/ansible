return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert({
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          -- Accept ([y]es) the completion.
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete({}),

          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        }),
        sources = {
          {
            name = 'lazydev',
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      })
    end,
  },
  -- {
  -- 	"hrsh7th/nvim-cmp",
  --
  -- 	dependencies = {
  -- 		"L3MON4D3/LuaSnip",
  -- 		"saadparwaiz1/cmp_luasnip",
  -- 		"rafamadriz/friendly-snippets",
  -- 	},
  -- 	config = function()
  -- 		require("luasnip.loaders.from_vscode").lazy_load()
  -- 		local cmp = require("cmp")
  -- 		cmp.setup({
  -- 			snippet = {
  -- 				-- REQUIRED - you must specify a snippet engine
  -- 				expand = function(args)
  -- 					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
  -- 				end,
  -- 			},
  -- 			window = {
  -- 				completion = cmp.config.window.bordered(),
  -- 				documentation = cmp.config.window.bordered(),
  -- 			},
  -- 			mapping = cmp.mapping.preset.insert({
  -- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
  -- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
  -- 				["<C-Space>"] = cmp.mapping.complete(),
  -- 				["<C-e>"] = cmp.mapping.abort(),
  -- 				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  -- 			}),
  -- 			sources = cmp.config.sources({
  -- 				-- { name = "nvim_lsp" },
  -- 				{ name = "luasnip" }, -- For luasnip users.
  -- 			}, {
  -- 				{ name = "buffer" },
  -- 			}),
  -- 		})
  -- 	end,
  -- },
}
