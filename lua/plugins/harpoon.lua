return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)

    vim.keymap.set('n', '<leader>r', function()
      harpoon:list():remove()
    end)

    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end)

    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end)

    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end)

    vim.keymap.set('n', '<leader>7', function()
      harpoon:list():select(7)
    end)

    vim.keymap.set('n', '<leader>8', function()
      harpoon:list():select(8)
    end)

    vim.keymap.set('n', '<leader>9', function()
      harpoon:list():select(9)
    end)

    vim.keymap.set('n', '<leader>10', function()
      harpoon:list():select(10)
    end)

    vim.keymap.set('n', '<leader>11', function()
      harpoon:list():select(11)
    end)

    vim.keymap.set('n', '<leader>12', function()
      harpoon:list():select(12)
    end)



    vim.keymap.set('n', '<leader>r1', function()
      harpoon:list():removeAt(1)
    end)

    vim.keymap.set('n', '<leader>r2', function()
      harpoon:list():removeAt(2)
    end)

    vim.keymap.set('n', '<leader>r3', function()
      harpoon:list():removeAt(3)
    end)

    vim.keymap.set('n', '<leader>r4', function()
      harpoon:list():removeAt(4)
    end)

    vim.keymap.set('n', '<leader>r5', function()
      harpoon:list():removeAt(5)
    end)

    vim.keymap.set('n', '<leader>r6', function()
      harpoon:list():removeAt(6)
    end)

    vim.keymap.set('n', '<leader>r7', function()
      harpoon:list():removeAt(7)
    end)

    vim.keymap.set('n', '<leader>r8', function()
      harpoon:list():removeAt(8)
    end)

    vim.keymap.set('n', '<leader>r9', function()
      harpoon:list():removeAt(9)
    end)

    vim.keymap.set('n', '<leader>r10', function()
      harpoon:list():removeAt(10)
    end)

    vim.keymap.set('n', '<leader>r11', function()
      harpoon:list():removeAt(11)
    end)

    vim.keymap.set('n', '<leader>r12', function()
      harpoon:list():removeAt(12)
    end)


    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
