return {
  "saghen/blink.cmp",
  version = "1.*", -- Release-Tags (prebuilt fuzzy binaries)
  event = "InsertEnter",

  -- Snippet-Collection (optional aber empfohlen, wenn du Snippets willst)
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    -- VSCode-artiges Verhalten: Tab für accept/snippet jump
    keymap = { preset = "super-tab" },

    sources = {
      -- "snippets" aktivieren
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- optional Quality-of-life:
    completion = {
      documentation = { auto_show = true }, -- Doku-Popup automatisch
    },
  },
}
