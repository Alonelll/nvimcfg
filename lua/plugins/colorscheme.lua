return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true, -- Setzt den Hintergrund auf transparent
    })
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("colorscheme cyberdream")
  end,
}
