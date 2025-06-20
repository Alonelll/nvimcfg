-- plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "cyberdream", -- Beispielthema
        theme = "ayu", -- Beispielthema
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
