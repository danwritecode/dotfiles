-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>o', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>e', ':Neotree close<CR>', { desc = 'NeoTree close' } },
  },
  opts = {
    filesystem = {
      window = {
        width = 30,
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree').close_all()
          vim.cmd 'Neotree close'
        end,
      },
    },
  },
}
