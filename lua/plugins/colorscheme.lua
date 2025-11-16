-- function ColorMyPencils(color)
--   color = color or "rose-pine"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- end

-- return {
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("cyberdream").setup({
--       transparent = true, -- Setzt den Hintergrund auf transparent
--       ide_fillchars = true,
--       hide_fillchars = true,
--     })
--     vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
--     vim.cmd("colorscheme cyberdream")
--   end,
-- }

-- return {
--   "ellisonleao/gruvbox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true,
--       transparent_mode = true,
--     })
--     -- Colorscheme aktivieren
--     vim.cmd.colorscheme("gruvbox")
--   end,
-- }
--
local user_ayu = {}
--- Example visual select colors
--  make sure you set vim.o.backgorund='light' in your init.lua
function user_ayu.get_visual_bg()
  if vim.o.background == "dark" then
    return { bg = "#666666" }
  else
    return { bg = "#000000" }
  end
end

local transparent = true
local my_overrides = {}

if transparent then
  my_overrides = {
    Normal = { bg = "None" },
    NormalFloat = { bg = "None" },
    ColorColumn = { bg = "None" },
    SignColumn = { bg = "None" },
    Folded = {
      bg = "None",
      -- bg = "#333333",
    },
    FoldColumn = { bg = "None", fg = "#AAAAAA" },
    CursorLine = { bg = "None" },
    Comment = { fg = "#AAAAAA" },
    CursorColumn = { bg = "None" },
    Search = { fg = "#FFFFFF", bg = "#235347" },
    Visual = user_ayu.get_visual_bg(),
    LineNr = { fg = "#AAAAAA" }, -- This is for transparency
    WhichKeyFloat = { bg = "None" },
    VertSplit = { bg = "None" },
    -- EndOfBuffer = { fg = "blue" },
    -- NonText = { bg = "blue" },
    -- vim.cmd([[:hi EndOfBuffer ctermfg=blue ctermbg=None]])
    -- vim.cmd([[:hi NonText ctermfg=12 guibg=bule]])
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "lightblue" })
    -- vim.opt.fillchars = { eob = "~" }
  }
else
  my_overrides = nil
end
--
return {
  "Shatur/neovim-ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      overrides = my_overrides,
      -- overrides = { Normal = { bg = "#1d2021" } }
    })

    -- vim.cmd([[colorscheme ayu-mirage]])
  end,
}
-- return {
--   "webhooked/kanso.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("kanso").setup({
--       theme = "zen",
--       terminal_colors = true,
--       transparent = true,
--     })
--     -- Colorscheme aktivieren
--     vim.cmd.colorscheme("kanso")
--   end,
-- }
-- -- return {
--   "ribru17/bamboo.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("bamboo").setup({
--       transparent = true,
--       lualine = {
--         transparent = true, -- lualine center bar transparency
--       },
--     })
--     require("bamboo").load()
--   end,
-- }
--
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       disable_background = true,
--       dim_inactive_windows = true,
--       variant = "moon",
--     })
--
--     vim.o.background = "dark"
--     vim.cmd("colorscheme rose-pine")
--
--     -- ColorMyPencils()
--   end,
-- }
