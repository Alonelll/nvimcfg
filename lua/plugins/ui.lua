return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
  },
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
    -- stylua: ignore
    close_command = function(n) Snacks.bufdelete(n) end,
    -- stylua: ignore
    right_mouse_command = function(n) Snacks.bufdelete(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            seperator = true,
          },
          {
            filetype = "snacks_layout_box",
          },
        },
        ---@param opts { filetype: string }
        get_element_icon = function(opts)
          return opts.filetype and LazyVim.config.icons.ft[opts.filetype] or nil
        end,
        seperator_style = "slant",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local buffer = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#363944",
          }
          return buffer
        end,
      })
    end,
  },
  -- LazyGit integration with Telescope
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        ";c",
        ":LazyGit<Return>",
        silent = true,
        noremap = true,
      },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      {

        "<leader>d",
        "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.icons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        use_libuv_file_watcher = true,
        default_component_configs = {
          indent = {
            with_expanders = true,
          },
        },
        filesystem = {
          hijack_netrw_behavior = "open_current",
          bind_to_cwd = true,
          follow_current_file = {
            enabled = true,
          },
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_by_name = {
              "node_modules",
            },
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["t"] = "open_tabnew",
            ["<cr>"] = "open",
            ["<esc>"] = "close_window",
          },
        },
        sort_case_insensitive = false,
        log_level = "info",
        log_to_file = true,
      })

      -- if vim.fn.argc(-1) == 0 then
      --   vim.defer_fn(function()
      --     vim.cmd("Neotree show")
      --   end, 50)
      -- end
    end,
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   config = function()
  --     require("nvim-tree").setup({
  --       on_attach = function(bufnr)
  --         local api = require("nvim-tree.api")
  --
  --         local function opts(desc)
  --           return {
  --             desc = "nvim-tree: " .. desc,
  --             buffer = bufnr,
  --             noremap = true,
  --             silent = true,
  --             nowait = true,
  --           }
  --         end
  --
  --         -- default mappings
  --         api.config.mappings.default_on_attach(bufnr)
  --
  --         -- custom mappings
  --         vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
  --       end,
  --       actions = {
  --         open_file = {
  --           quit_on_open = true,
  --         },
  --       },
  --       sort = {
  --         sorter = "case_sensitive",
  --       },
  --       view = {
  --         adaptive_size = true,
  --         width = 30,
  --         relativenumber = true,
  --       },
  --       renderer = {
  --         group_empty = true,
  --       },
  --       filters = {
  --         dotfiles = true,
  --         custom = {
  --           "node_modules/.*",
  --         },
  --       },
  --       log = {
  --         enable = true,
  --         truncate = true,
  --         types = {
  --           diagnostics = true,
  --           git = true,
  --           profile = true,
  --           watcher = true,
  --         },
  --       },
  --     })
  --
  --     -- if vim.fn.argc(-1) == 0 then
  --     --   vim.cmd("NvimTreeFocus")
  --     -- end
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      image = { enabled = false },
    },
  },
}
