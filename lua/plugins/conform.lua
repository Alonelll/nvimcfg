return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>ff",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- [...]
    formatters_by_ft = {
      liquid = { "prettierd", "prettier", stop_after_first = true },
      -- liquid = { 'liquid-formatter' },
    },
  },
}
