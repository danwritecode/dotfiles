return {
  -- Tree-sitter grammar for RSTML (Rust HTML templates)
  {
    'rayliwell/tree-sitter-rstml',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    build = ':TSUpdate',
    config = function()
      require('tree-sitter-rstml').setup()
    end,
  },

  -- Auto-closing tags for HTML in Rust files
  {
    'rayliwell/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Enhanced rust-analyzer configuration for Leptos
  -- {
  --   'neovim/nvim-lspconfig',
  --   opts = {},
  --   init = function()
  --     -- This will run before the LSP setup in your init.lua
  --     local orig_setup = require('lspconfig').rust_analyzer.setup
  --
  --     -- Override the rust_analyzer setup function to add our Leptos-specific settings
  --     require('lspconfig').rust_analyzer.setup = function(opts)
  --       -- Preserve existing settings
  --       opts = opts or {}
  --       opts.settings = opts.settings or {}
  --       opts.settings['rust-analyzer'] = opts.settings['rust-analyzer'] or {}
  --
  --       -- Merge in Leptos-specific settings
  --       local leptos_settings = {
  --         -- Enable proc macro expansion and ignore the server macro
  --         procMacro = {
  --           enable = true,
  --           ignored = {
  --             ['leptos-macro'] = { 'server' },
  --           },
  --         },
  --         -- Enable all features in the project
  --         cargo = {
  --           allFeatures = true,
  --           loadOutDirsFromCheck = true,
  --           autoreload = true,
  --         },
  --         -- Run clippy with all features on save
  --         checkOnSave = {
  --           allFeatures = true,
  --           command = 'clippy',
  --         },
  --         -- Configure leptosfmt to run before rustfmt
  --         rustfmt = {
  --           overrideCommand = { 'leptosfmt', '--stdin', '--rustfmt' },
  --         },
  --         -- Enable inlay hints
  --         inlayHints = {
  --           enable = true,
  --           typeHints = true,
  --           parameterHints = true,
  --         },
  --         -- Enable lens features
  --         lens = {
  --           enable = true,
  --           references = true,
  --           implementations = true,
  --           enumVariantReferences = true,
  --           methodReferences = true,
  --         },
  --         -- Enable hover actions
  --         hoverActions = {
  --           enable = true,
  --         },
  --         -- Enable call info
  --         callInfo = {
  --           full = true,
  --         },
  --       }
  --
  --       -- Merge our settings with existing settings
  --       opts.settings['rust-analyzer'] = vim.tbl_deep_extend('force', opts.settings['rust-analyzer'], leptos_settings)
  --
  --       -- Call the original setup function with our enhanced options
  --       orig_setup(opts)
  --     end
  --   end,
  -- },

  -- Add leptosfmt command
  {
    'nvim-lua/plenary.nvim',
    config = function()
      -- Create a user command for formatting with leptosfmt
      vim.api.nvim_create_user_command('LeptosFmt', function()
        local file = vim.fn.expand '%'
        vim.fn.system('leptosfmt --rustfmt ' .. file)
        vim.cmd 'e!' -- Reload the file
      end, {})

      -- Add keybinding for Rust files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'rust',
        callback = function()
          vim.keymap.set('n', '<leader>lp', '<cmd>LeptosFmt<CR>', { buffer = true, desc = 'Format with leptosfmt' })
        end,
      })
    end,
  },
}
