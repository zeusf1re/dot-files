return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
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
      
      -- Добавляем пустые строки после арта
      local header_with_spacing = {}
      for _, line in ipairs(mayhem_art) do
        table.insert(header_with_spacing, line)
      end
      -- Добавляем 2 пустые строки после арта
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
              action = 'Telescope find_files'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'File Explorer       ',
              desc_hl = 'String',
              key = 'e',
              key_hl = 'Number',
              action = 'Neotree'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'New File            ',
              desc_hl = 'String',
              key = 'n',
              key_hl = 'Number',
              action = 'enew'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Config              ',
              desc_hl = 'String',
              key = 'c',
              key_hl = 'Number',
              action = 'e ~/.config/nvim/init.lua'
            },
            {
              icon = '󰩈 ',
              icon_hl = 'Title',
              desc = 'Quit                ',
              desc_hl = 'String',
              key = 'q',
              key_hl = 'Number',
              action = 'qa'
            },
          },
          -- Добавляем пустые строки перед футером
          footer = {"", "", "", "", "", "⚡ Mayhem Mode Activated ⚡"}  -- 2 пустые строки + текст
        }
      })

      -- Настройка цветов в стиле Kanagawa
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#DCA561" })  -- Оранжевый
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#7E9CD8" })  -- Синий
      vim.api.nvim_set_hl(0, "DashboardShortcut", { fg = "#957FB8" }) -- Фиолетовый
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#6A9589" })   -- Зеленый
    end,
  }
}
