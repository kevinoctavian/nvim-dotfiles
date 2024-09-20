-- github = https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/dap/core.lua
---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
  end
  return config
end

return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      {
        "stevearc/overseer.nvim",
        opts = {},
      },
      { "akinsho/toggleterm.nvim", version = "*", config = true },
    },
    config = function()
      require("cmake-tools").setup({
        cmake_command = "/usr/bin/cmake", -- CMake command line executable
        cmake_build_directory = "build", -- Default build directory
        cmake_build_type = "Debug", -- Default build type
        cmake_generate_options = {
          "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
          "-DCMAKE_CXX_COMPILER=clang++",
          "-DCMAKE_C_COMPILER=clang",
        }, -- Additional options for CMake generation
        cmake_build_options = {}, -- Additional options for CMake build
        cmake_console_size = 10, -- Console window height or width
        cmake_show_console = "always", -- When to show the console
        cmake_dap_configuration = { -- Debugging configurations for nvim-dap
          name = "CMake Debug",
          type = "cppdbg",
          request = "launch",
          stopAtEntry = false,
          runInTerminal = true,
        },
        cmake_variants_message = {
          short = { "--", "-DCMAKE_BUILD_TYPE=Debug" },
          long = { "Release", "-DCMAKE_BUILD_TYPE=Release" },
        },
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    {
      "mfussenegger/nvim-dap",
      dependencies = {
        {
          "rcarriga/nvim-dap-ui",
          dependencies = "nvim-neotest/nvim-nio",
        },
        {
          "theHamsta/nvim-dap-virtual-text",
          opts = {},
        },
      },
      config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end

        -- setup dap config by VsCode launch.json file
        local vscode = require("dap.ext.vscode")
        local json = require("plenary.json")
        ---@diagnostic disable-next-line: duplicate-set-field
        vscode.json_decode = function(str)
          return vim.json.decode(json.json_strip_comments(str, {}))
        end

        -- Extends dap.configurations with entries read from .vscode/launch.json
        if vim.fn.filereadable(".vscode/launch.json") then
          vscode.load_launchjs()
        end

        if vim.fn.executable(vim.fn.stdpath("data") .. "/mason/bin/codelldb") then
          require("vins.plugins.debug-config.c")
        end
      end,
      -- stylua: ignore
      -- @type LazyKeysSpec[]
      -- github https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/dap/core.lua
    keys = {
      { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    },
  },
}
