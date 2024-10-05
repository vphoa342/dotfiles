return {
  -- Other plugins...

  -- Kanagawa colorscheme
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },
}

