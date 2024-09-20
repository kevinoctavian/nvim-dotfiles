return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        indicator = {
          style = "icon",
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "everforest",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
          "alpha",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          "filename",
          function()
            local cmake = require("cmake-tools")
            if cmake.is_cmake_project() then
              return require("cmake-tools").get_build_type()
            else
              return ""
            end
          end,
          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end -- not recording
            return "recording to @" .. reg
          end,
        },
        lualine_x = { "encoding", { "fileformat", right_padding = 2 }, "filetype" },
        lualine_y = {
          { "progress", separator = { right = "" } },
          "location",
        },
        lualine_z = { "os.date('%a %d/%m/%Y')" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    version = "4.4.7",
    -- enabled = false,
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        signature = {
          opts = { size = { max_height = 15 } },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    {
      "goolord/alpha-nvim",
      -- dependencies = { 'echasnovski/mini.icons' },
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡍⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⣽⡶⣛⣯⣴⣷⣞⢷⣶⣯⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
          "⣿⣿⣿⣿⡿⢿⡟⠛⣫⣾⡿⣿⣿⣿⣿⣿⣿⣿⣷⡝⣿⣿⣷⣎⢛⠛⣻⠿⣿⣿⣿⣿⣿",
          "⣿⣿⣏⣾⣿⠏⠀⣼⣿⡟⣼⡇⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣷⡡⠙⢿⣷⢸⣿⣿⣿",
          "⣿⣿⣿⡸⠟⢀⣾⣿⡿⢼⣿⠷⣿⣿⣿⣿⡏⢿⣿⣿⣿⣿⡝⣏⣿⣿⡅⠘⡏⣿⣿⣿⣿",
          "⣿⣿⣿⣷⠀⣾⢧⣿⢳⢸⣿⢀⣇⣿⣿⣿⣷⢪⢻⣿⣯⢿⣷⣿⡼⣿⣿⣁⣸⣿⣿⣿⣿",
          "⣿⣿⣿⣿⣸⢸⣼⡟⣿⣉⢿⢸⡼⣞⢿⣿⣿⣞⣷⡽⢿⡾⣿⢾⣇⣿⢹⣧⢿⣿⣿⣿⣿",
          "⣿⣿⣿⣇⣿⡇⣿⣧⢣⣿⠮⡋⠿⣮⣐⢽⣻⠿⠜⡿⠷⡅⢣⡜⣿⢹⢸⣿⡜⣿⣿⣿⣿",
          "⣿⣿⣿⣸⣿⡇⣿⢨⠏⢀⢄⣀⢌⢺⣿⣿⣿⣿⣷⢊⣀⣀⢄⠈⢞⢸⢸⣿⡇⠸⣿⣿⣿",
          "⣿⣿⡏⣿⣿⢹⢻⠘⢰⣇⡟⡍⡇⣾⣿⣿⣿⣿⣯⡦⡏⣽⡞⣧⠸⢸⣼⣿⣿⡆⢻⣿⣿",
          "⣿⣿⣠⣿⣿⡏⡾⢸⣸⣏⠿⡾⢣⣿⣿⣿⣿⣿⣿⣧⠿⠾⣳⣿⣼⣏⣿⣿⣿⣷⣏⣿⣿",
          "⣿⢧⣿⣿⣿⣿⡵⠛⣿⣿⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣻⣿⡇⣼⣿⣿⣿⣿⣿⣼⣿",
          "⡟⣾⡿⣿⣿⣿⣷⡀⢿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⡿⣰⣿⣿⣿⣿⣿⣿⣇⣿",
          "⣧⣇⣧⢿⣿⣿⣿⣿⡜⣿⣿⣿⣿⣿⣿⣾⣿⣼⣿⣿⣿⣿⡿⣱⣿⣿⣿⣿⣿⡟⣿⣿⢸",
          "⣿⣸⡹⡼⣿⣿⣿⣿⣿⢰⡍⡛⡿⢿⣿⣿⣿⣿⣿⡿⠟⣻⢥⣿⣿⣿⣿⣿⣿⠁⣿⣿⣿",
          "⡏⣷⡳⡱⡹⣿⣿⣿⣿⣾⠳⣹⢏⢾⣶⣶⣿⣶⣾⢎⢧⢃⣸⣿⣿⣿⣿⡿⡓⣼⡟⣿⢹",
          "⣿⡝⣿⣮⡊⠘⢿⣿⣿⢀⣌⣽⣶⣿⣿⣿⣿⣿⣿⣿⣾⡅⢿⣿⣿⡿⡟⠑⣼⡿⣹⢏⣿",
          "⣿⣿⣮⣻⠿⣦⢒⣝⡿⢿⣿⣾⣻⠿⠿⣿⡿⠿⠿⠿⢟⣽⡼⢿⣫⣎⢡⡾⣻⠾⣫⣾⣿",
          "⣿⣿⣿⣿⣿⡟⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣶⣾⣿⣿⣿⣿",
        }

        dashboard.section.buttons.val = {
          dashboard.button("n", "󰱼  New File", "<CMD>ene <BAR> startinsert<CR>"),
          dashboard.button("f", "  Find File", "<CMD>Telescope find_files<CR>"),
          dashboard.button("r", "󰘁  Recently used files", "<CMD>Telescope oldfiles<CR>"),
          dashboard.button("t", "  Find Text", "<CMD>Telescope live_grep<CR>"),
          dashboard.button(
            "c",
            "  Configuration",
            "<CMD>cd ~/.config/nvim<CR><CMD>e ~/.config/nvim/lua/vins/lazy.lua<CR>"
          ),
          dashboard.button("q", "󰩈  Quit Neovim", "<CMD>qa<CR>"),
        }

        dashboard.section.footer.val = "Don't stop, keep coding until die..."

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.section.buttons.opts.spacing = 1

        dashboard.opts.opts.noautocmd = true

        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "AlphaReady",
            callback = function()
              require("lazy").show()
            end,
          })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "LazyVimStarted",
          callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.val = dashboard.section.footer.val
              .. "\n⚡ Neovim loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
  },
}
