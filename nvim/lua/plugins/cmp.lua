return {
  -- Плагин автодополнения
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- Источник от LSP
      "hrsh7th/cmp-buffer",     -- Источник из буфера
      "hrsh7th/cmp-path",       -- Источник путей
      "L3MON4D3/LuaSnip",       -- Сниппеты
    },
    config = function()
      local cmp = require("cmp")
      
      -- Настройка цветов в стиле Kanagawa
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#DCA561" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7E9CD8" })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#957FB8" })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#6A9589" })
      
      -- Настройка Pmenu (окна автодополнения)
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1F1F28" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2A2A37", fg = "#DCA561" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1F1F28" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#363646" })

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },    -- Подсказки от LSP
        }, {
          { name = 'buffer' },      -- Подсказки из буфера
          { name = 'path' },        -- Подсказки путей
        }),
        
        -- Стилизация окошка
        formatting = {
          format = function(entry, vim_item)
            -- Иконки для разных типов
            local icons = {
              Text = "📄",
              Method = "ƒ",
              Function = "",
              Constructor = "",
              Field = "ﰠ",
              Variable = "",
              Class = "",
              Interface = "ﰮ",
              Module = "",
              Property = "",
              Unit = "",
              Value = "",
              Enum = "ℰ",
              Keyword = "",
              Snippet = "",
              Color = "",
              File = "",
              Reference = "",
              Folder = "",
              EnumMember = "",
              Constant = "",
              Struct = "",
              Event = "",
              Operator = "",
              TypeParameter = "",
            }
            
            vim_item.kind = string.format('%s %s', icons[vim_item.kind] or '?', vim_item.kind)
            
            -- Цвета в стиле Kanagawa
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              buffer = '[Buffer]',
              path = '[Path]',
            })[entry.source.name]
            
            return vim_item
          end,
        },
        
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
        },
      })
    end
  }
}
