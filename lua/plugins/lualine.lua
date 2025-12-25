-- plugins/lualine.lua
-- return {
--   "nvim-lualine/lualine.nvim",
--   config = function()
--     require("lualine").setup({
--       options = {
--         -- theme = "bamboo", -- Beispielthema
--         theme = "kanagawa", -- Beispielthema
--         -- theme = "gruvbox", -- Beispielthema
--         icons_enabled = true,
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch", "diff" },
--         lualine_c = { "filename" },
--         lualine_x = { "encoding", "fileformat", "filetype" },
--         lualine_y = { "progress" },
--         lualine_z = { "location" },
--       },
--     })
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local LazyVim = require("lazyvim.util")
    opts.options = opts.options or {}
    -- opts.options.theme = "kanagawa"
    opts.options.icons_enabled = true

    opts.sections = opts.sections or {}
    opts.sections.lualine_a = { "mode" }
    opts.sections.lualine_b = { "branch", "diff" }
    opts.sections.lualine_c = opts.sections.lualine_c or { "filename" }
    opts.sections.lualine_c[4] = {
      LazyVim.lualine.pretty_path({
        length = 0,
        relative = "cwd",
        modified_hl = "MatchParen",
        directory_hl = "",
        filename_hl = "Bold",
        modified_sign = "",
        readonly_icon = " 󰌾 ",
      }),
    }
    opts.sections.lualine_x = { "encoding", "fileformat", "filetype" }
    opts.sections.lualine_y = { "progress" }
    opts.sections.lualine_z = { "location" }
  end,
}
