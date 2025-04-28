return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'nvimtools/none-ls.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LSP_Group', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local function get_compile_commands_arg()
        local build_dir = vim.fn.system(
          "find . -maxdepth 2 -type d -regex './\\(build/Debug\\|build_x86_64/Debug\\|build/RelWithDebInfo\\)' 2>/dev/null | head -n 1"
        )
        build_dir = string.gsub(build_dir, '%s+$', '') -- Remove trailing whitespaces
        build_dir = string.gsub(build_dir, '^%./', '') -- Remove leading "./" if it exists

        local compile_commands_arg = '--compile-commands-dir='
        if build_dir == '' then
          vim.notify('No build directory found!', vim.log.levels.WARN, { title = 'clangd' })
          compile_commands_arg = compile_commands_arg .. '.' -- Or some default, like the current directory
        else
          compile_commands_arg = compile_commands_arg .. build_dir
        end

        return compile_commands_arg
      end
      local lsp_servers = {
        clangd = {
          root_dir = require('lspconfig.util').root_pattern('.git', 'Makefile', 'CMakeLists.txt'),
          cmd = {
            'clangd',
            get_compile_commands_arg(),
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          filetypes = { 'c', 'cpp' },
          init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            cache = { directory = vim.fn.expand('~/.cache/clangd') },
            enableInlayHints = true,
            enableSnippets = true,
            enableAST = true,
            enableFoldingRanges = true,
            enableTypeHierarchy = true,
            enableHover = true,
            enableDocumentSymbols = true,
            enableWorkspaceSymbols = true,
            enableReferences = true,
            enableRename = true,
            enableCodeActions = true,
            enableDiagnostics = true,
            enableCompletion = true,
            enableSignatureHelp = true,
            enableFormat = true,
            enableHighlight = true,
            enableSemanticHighlighting = true,
            enableMemoryUsage = true,
            enablePerformance = true,
            enableDebugLog = true,
          },
        },
        marksman = {},
        pylsp = {},
        -- ['sonarlint-language-server'] = {},
        -- rust_analyzer = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }
      local ensure_tools_installed = vim.tbl_keys(lsp_servers or {})
      vim.list_extend(ensure_tools_installed, {
        'stylua',
        'prettier',
        'clang-format',
        'black',
        'tree-sitter-cli',
        -- 'sonarlint-language-server',
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure_tools_installed })
      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = lsp_servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })

      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.clang_format.with({
            filetypes = { 'c', 'cpp', 'h', 'hpp' },
            -- extra_args = {'--style=/home/asalim10/work/FHCM/FNV4ZONAL-83963/.clang-format' },
          }),
        },
        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format current buffer' }),
      })
    end,
  },
}
