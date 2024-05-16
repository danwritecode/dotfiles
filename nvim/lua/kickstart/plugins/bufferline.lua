return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    }
    vim.api.nvim_set_keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true, desc = 'Prev Buffer' })
    vim.api.nvim_set_keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })
    vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>bdelete<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
  end,
}
