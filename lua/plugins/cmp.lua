local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },

  opts = {
    mapping = {
      -- Kontextmenü öffnen (Autocomplete)
      ["<C-Space>"] = cmp.mapping.complete(),

      -- Vorschlag bestätigen
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      -- Navigation im Menü
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),

      -- Menü schließen
      ["<C-e>"] = cmp.mapping.close(),

      -- Tab zum Durchwechseln der Vorschläge
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
  },
}
