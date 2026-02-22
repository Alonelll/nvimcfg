return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local LazyVim = require("lazyvim.util")
    opts.options = opts.options or {}
    opts.options.theme = function()
      local theme = require("lualine.themes.kanagawa")

      -- 🔥 kompletter schwarzer Hintergrund
      for _, mode in pairs(theme) do
        if type(mode) == "table" then
          for _, section in pairs(mode) do
            if section.bg then
              section.bg = "#000000"
            end
          end
        end
      end

      return theme
    end
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
