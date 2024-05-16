return {
  'numToStr/FTerm.nvim',
  version = '*',
  config = function()
    vim.keymap.set('n', '<F7>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<F7>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
