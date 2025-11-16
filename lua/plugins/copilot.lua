return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<S-Tab>",
          next = "<C-j>",
          prev = "<C-k>",
        },
      },
      panel = { enabled = true },
    })
  end,
}
