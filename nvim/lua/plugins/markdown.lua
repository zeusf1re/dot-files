return {
  -- Tabular (для таблиц)
  {
    "godlygeek/tabular",
    ft = "markdown",
  },

  -- Основная подсветка Markdown
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_new_list_item_indent = 2
      vim.g.vim_markdown_auto_insert_bullets = 1
    end
  },

  -- КРАСИВЫЙ РЕНДЕР Markview
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("markview").setup({
        -- Основные настройки
        save = {
          enabled = true,  -- Автосохранение при выходе
          location = "current", -- "current" или "split"
        },
        hooks = {
          before = function() end, -- функция перед открытием
          after = function() end,  -- функция после открытия
        },
        -- Стили (можно кастомизировать под свою тему)
        styles = {
          headings = {
            h1 = { fg = "#ff6c6b", bold = true },
            h2 = { fg = "#da8548", bold = true },
            h3 = { fg = "#ecbe7b", bold = true },
            h4 = { fg = "#a9a1e1", bold = true },
            h5 = { fg = "#c678dd", bold = true },
            h6 = { fg = "#51afef", bold = true },
          },
          block = {
            code = { fg = "#a9a1e1", italic = true },
            quote = { fg = "#5b6268", italic = true },
          },
          inline = {
            code = { fg = "#da8548" },
            link = { fg = "#51afef", underline = true },
            strong = { fg = "#ff6c6b", bold = true },
            emphasis = { fg = "#da8548", italic = true },
          },
          list = {
            unordered = { fg = "#51afef" },
            ordered = { fg = "#ecbe7b" },
          },
        }
      })
    end
  },

  -- Автоформатирование таблиц
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    dependencies = { "godlygeek/tabular" },
    config = function()
      vim.g.table_mode_corner = '|'
      vim.g.table_mode_header_fillchar = '-'
    end
  },

  -- АВТОМАТИЧЕСКИЕ СПИСКИ
  {
    "gaoDean/autolist.nvim",
    ft = "markdown",
    config = function()
      require("autolist").setup({
        enabled = true,
        list_types = {
          unordered = {"-", "*", "+"},
          ordered = ".",
        },
      })
    end,
  },

  -- КОНФИГУРАЦИЯ И КЛАВИШИ MARKDOWN
  {
    "nvim-lua/plenary.nvim",
    config = function()
      -- Автокоманды для Markdown
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.spell = true
          vim.opt_local.spelllang = 'ru,en'
          vim.opt_local.conceallevel = 0
          vim.opt_local.autoindent = true
          vim.opt_local.smartindent = true
        end
      })

      -- ========== КЛАВИШИ ДЛЯ MARKDOWN ==========
      
      -- Markview - красивый рендер
      vim.keymap.set('n', '<leader>mv', '<cmd>Markview<cr>', { desc = 'Markview Toggle' })
      
      -- Glow (как альтернатива)
      vim.keymap.set('n', '<leader>mg', '<cmd>Glow<cr>', { desc = 'Glow Preview' })

      -- Таблицы
      vim.keymap.set('n', '<leader>mt', '<cmd>TableModeToggle<cr>', { desc = 'Table Mode Toggle' })
      vim.keymap.set('n', '<leader>m=', '<cmd>TableFormat<cr>', { desc = 'Format Table' })

      -- Заголовки
      vim.keymap.set('n', '<leader>m1', 'i# <esc>', { desc = 'Add H1' })
      vim.keymap.set('n', '<leader>m2', 'i## <esc>', { desc = 'Add H2' })
      vim.keymap.set('n', '<leader>m3', 'i### <esc>', { desc = 'Add H3' })
      vim.keymap.set('n', '<leader>m4', 'i#### <esc>', { desc = 'Add H4' })

      -- Форматирование текста
      vim.keymap.set('v', '<leader>mb', 'c****<esc>hp', { desc = 'Bold Text' })
      vim.keymap.set('v', '<leader>mi', 'c**<esc>hp', { desc = 'Italic Text' })
      vim.keymap.set('v', '<leader>mc', 'c``<esc>hp', { desc = 'Inline Code' })
      vim.keymap.set('n', '<leader>mcc', 'i```<cr><cr>```<esc>ki', { desc = 'Code Block' })

      -- Ссылки и списки
      vim.keymap.set('v', '<leader>ml', 'c[]()<esc>hpi', { desc = 'Add Link' })
      vim.keymap.set('n', '<leader>m-', 'i- <esc>', { desc = 'Add Bullet' })
      vim.keymap.set('n', '<leader>m*', 'i* <esc>', { desc = 'Add Asterisk Bullet' })
      vim.keymap.set('n', '<leader>mn', 'i1. <esc>', { desc = 'Add Numbered List' })

      -- Орфография
      vim.keymap.set('n', '<leader>ms', '<cmd>set spell!<cr>', { desc = 'Toggle Spell Check' })

-- Простое открытие в Firefox
vim.keymap.set('n', '<leader>mb', function()
  local filename = vim.fn.expand("%:p")
  if filename ~= "" then
    vim.fn.jobstart({"firefox", filename}, {detach = true})
    print("Opened in Firefox: " .. filename)
  else
    print("No file to preview")
  end
end, { desc = 'Open in Firefox' })
      print("Markdown setup complete! Use <leader>m* commands")
      print("<leader>mv - Toggle beautiful Markview render!")
    end
  }
}
