return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
		},
	config = function()
		vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
		vim.keymap.set('n', '<C-c>', ':Neotree close<CR>', {})

		vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', {})

		vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>', {})
	end
}


