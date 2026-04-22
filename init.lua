vim.g.useLazyGit = true
if vim.loader then
  vim.loader.enable()
end

-- _G.dd = function(...)
-- 	require("util.debug").dump(...)
-- end
-- vim.print = _G.dd

require("config.lazy")

-- vim.o.guicursor = "n-v-c:block"
vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#555555", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#555555", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "NONE", bold = true })
-- Transparenz für Terminal / LazyGit
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Terminal", { bg = "NONE" })
