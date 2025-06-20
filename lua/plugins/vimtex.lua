return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = vim.env.VIMTEX_VIEW_METHOD or 'zathura'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_reading_bar = 1
    vim.g.vimtex_quickfix_ignore_filters = {
      'Overfull',
      'specifier changed to',
      'Underfull',
    }
  end,
}
