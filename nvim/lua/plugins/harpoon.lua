return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})

    -- Basic keybinds
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, 
      { desc = "Add file to Harpoon" })
    
    -- Quick menu (alternative to telescope for compatibility)
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon quick menu" })
    
    -- File selection keybinds (using different keys to avoid conflicts)
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
      { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
      { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
      { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
      { desc = "Harpoon file 4" })
    
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
      { desc = "Harpoon previous file" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
      { desc = "Harpoon next file" })

    -- Telescope integration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Use <leader>ht for telescope to avoid conflicts
    vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end,
      { desc = "Harpoon Telescope" })
  end
}
