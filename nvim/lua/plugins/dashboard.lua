return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-telescope/telescope.nvim" }, -- Добавляем зависимость
    config = function()
      local dashboard = require("dashboard")
      local mayhem_art = {
        "",
        "",
        "",
        "███╗   ███╗ █████╗ ██╗   ██╗██╗  ██╗███████╗███╗   ███╗",
        "████╗ ████║██╔══██╗╚██╗ ██╔╝██║  ██║██╔════╝████╗ ████║",
        "██╔████╔██║███████║ ╚████╔╝ ███████║█████╗  ██╔████╔██║",
        "██║╚██╔╝██║██╔══██║  ╚██╔╝  ██╔══██║██╔══╝  ██║╚██╔╝██║",
        "██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║███████╗██║ ╚═╝ ██║",
        "╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝",
      }
      
      local header_with_spacing = {}
      for _, line in ipairs(mayhem_art) do
        table.insert(header_with_spacing, line)
      end
      table.insert(header_with_spacing, "")
      table.insert(header_with_spacing, "")
      table.insert(header_with_spacing, "")
      table.insert(header_with_spacing, "")
      table.insert(header_with_spacing, "")
      
      dashboard.setup({
        theme = 'doom',
        config = {
          header = header_with_spacing,
          center = {
            {
              icon = '󰍉 ',
              icon_hl = 'Title',
              desc = 'Find File           ',
              desc_hl = 'String',
              key = 'f',
              key_hl = 'Number',
              action = function()
                require("telescope.builtin").find_files()
              end
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'File Explorer       ',
              desc_hl = 'String',
              key = 'e',
              key_hl = 'Number',
              action = function()
                vim.cmd("Neotree")
              end
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'New File            ',
              desc_hl = 'String',
              key = 'n',
              key_hl = 'Number',
              action = function()
                vim.cmd("enew")
              end
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Config              ',
              desc_hl = 'String',
              key = 'c',
              key_hl = 'Number',
              action = function()
                vim.cmd("e ~/.config/nvim/init.lua")
              end
            },
            {
              icon = '󰩈 ',
              icon_hl = 'Title',
              desc = 'Quit                ',
              desc_hl = 'String',
              key = 'q',
              key_hl = 'Number',
              action = function()
                vim.cmd("qa")
              end
            },
          },
          footer = {"", "", "", "", "", "⚡ Mayhem Mode Activated ⚡"}
        }
      })

      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#DCA561" })
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#7E9CD8" })
      vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = "#957FB8" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#6A9589" })
    end,
  }
}
