return {
  'numToStr/FTerm.nvim',
  version = '*',
  config = function()
    -- require FTerm
    local fterm = require 'FTerm'

    -- set up gitui configuration
    local lazygit = fterm:new {
      ft = 'fterm_lazygit',
      cmd = 'lazygit',
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    }

    -- map the key to toggle the default FTerm floating terminal
    vim.keymap.set('n', '<F7>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<F7>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

    -- map the key to toggle gitui in a floating terminal
    vim.keymap.set('n', '<F6>', function()
      lazygit:toggle()
    end)

    vim.keymap.set('t', '<F6>', function()
      lazygit:close()
    end)
  end,
}
