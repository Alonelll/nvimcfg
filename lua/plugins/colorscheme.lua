-- function ColorMyPencils(color)
--   color = color or "rose-pine"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
--       transparent_mode = false,
--     })
--     -- Colorscheme aktivieren
--     vim.cmd.colorscheme("gruvbox")
--   end,
-- }
-- --
-- local user_ayu = {}
-- --- Example visual select colors
-- --  make sure you set vim.o.backgorund='light' in your init.lua
-- function user_ayu.get_visual_bg()
--   if vim.o.background == "dark" then
--     return { bg = "#666666" }
--   else
--     return { bg = "#000000" }
--   end
-- end
--
-- local transparent = true
-- local my_overrides = {}
--
-- if transparent then
--   my_overrides = {
--     Normal = { bg = "None" },
--     NormalFloat = { bg = "None" },
--     ColorColumn = { bg = "None" },
--     SignColumn = { bg = "None" },
--     Folded = {
--       bg = "None",
--       -- bg = "#333333",
--     },
--     FoldColumn = { bg = "None", fg = "#AAAAAA" },
--     CursorLine = { bg = "None" },
--     Comment = { fg = "#AAAAAA" },
--     CursorColumn = { bg = "None" },
--     Search = { fg = "#FFFFFF", bg = "#235347" },
--     Visual = user_ayu.get_visual_bg(),
--     LineNr = { fg = "#AAAAAA" }, -- This is for transparency
--     WhichKeyFloat = { bg = "None" },
--     VertSplit = { bg = "None" },
--     -- EndOfBuffer = { fg = "blue" },
--     -- NonText = { bg = "blue" },
--     -- vim.cmd([[:hi EndOfBuffer ctermfg=blue ctermbg=None]])
--     -- vim.cmd([[:hi NonText ctermfg=12 guibg=bule]])
--     -- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "lightblue" })
--     -- vim.opt.fillchars = { eob = "~" }
--   }
-- else
--   my_overrides = nil
-- end
-- --
-- return {
--   "Shatur/neovim-ayu",
--   priority = 1000,
--   config = function()
--     require("ayu").setup({
--       overrides = my_overrides,
--       transparent = transparent,
--       -- overrides = { Normal = { bg = "#1d2021" } }
--     })
--
--     -- vim.cmd([[colorscheme ayu-mirage]])
--   end,
-- }
-- return {
--   "webhooked/kanso.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("kanso").setup({
--       theme = "mist",
--       terminal_colors = true,
--       transparent = false,
--     })
--     -- Colorscheme aktivieren
--     vim.cmd.colorscheme("kanso")
--   end,
-- }
-- return {
--   "ribru17/bamboo.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("bamboo").setup({
--       transparent = false,
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
--     })
--
--     vim.o.background = "dark"
--     vim.cmd("colorscheme rose-pine")
--
--     ColorMyPencils()
--   end,
-- }
--
--
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- sorgt dafür, dass es beim Start geladen wird
    priority = 1000, -- lädt das Theme vor allen anderen Plugins
    opts = {
      -- ==== Basis-Einstellungen ====
      compile = false, -- false = kein Bytecode kompilieren
      undercurl = true, -- untercurl für Fehlerunterstreichungen
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- true = kein Hintergrund setzen
      dimInactive = false, -- false = keine inactive Fenster abdunkeln
      terminalColors = true, -- true = terminal_color_0-17 setzen

      -- ==== Thema & Farben ====
      theme = "dragon", -- lädt explizit den dragon-Style
      background = {
        dark = "dragon", -- bei dunklem Hintergrund dragon wählen
        light = "lotus", -- falls du jemals light brauchst
      },

      colors = {
        palette = {}, -- optional: eigene Palette overrides
        theme = {
          wave = {},
          lotus = {},
          dragon = {}, -- optional: spezielle dragon overrides
          all = {}, -- global overrides für alle Varianten
        },
      },

      -- ==== Override Highlights (optional) ====
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Beispiel: transparente Floats
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },

          -- Beispiel: CursorLine & CursorColumn minimal anpassen
          CursorLine = { bg = theme.ui.bg_p2 },
          CursorColumn = { bg = theme.ui.bg_p2 },

          -- Beispiel: leichte Kontrastfarben für LSP Diagnostics
          DiagnosticError = { fg = theme.diag.error, bold = true },
          DiagnosticWarn = { fg = theme.diag.warning, underline = true },
          DiagnosticInfo = { fg = theme.diag.info },
          DiagnosticHint = { fg = theme.diag.hint },
        }
      end,
    },
    config = function(_, opts)
      -- Setup mit den opts, die lazy.nvim übergibt
      require("kanagawa").setup(opts)
      -- Setzt die Colorscheme-Variante
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
