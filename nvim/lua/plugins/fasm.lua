return {
  -- Подсветка синтаксиса для ассемблера (ПРОВЕРЕННЫЙ плагин)
  {
    "Shirk/vim-gas", -- Отличный плагин для подсветки ассемблера
    ft = "asm",
    config = function()
      -- Указываем что используем синтаксис NASM/FASM
      vim.g.asmsyntax = 'nasm' -- NASM синтаксис хорошо подходит для FASM
      
      -- Настройки для ассемблера
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "asm",
        callback = function()
          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.expandtab = false
          vim.bo.commentstring = "; %s"
        end
      })
    end
  },

  -- Дерево синтаксиса (необязательно, но полезно)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "asm", -- Добавляем поддержку ассемблера
      }
    }
  },

  -- Сниппеты для ассемблера
  {
    "L3MON4D3/LuaSnip",
    ft = "asm",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Простые сниппеты для FASM
      ls.add_snippets("asm", {
        s("fasm_base", {
          t({"format ELF executable", "entry _start", "", "segment readable executable", "", "_start:", ""}),
          i(1, "; ваш код здесь"),
          t({"", "    mov eax, 1", "    mov ebx, 0", "    int 0x80", "", "segment readable writeable", ""}),
          i(2, "; данные здесь")
        }),

        s("syscall", {
          t("mov eax, "), i(1, "4"), t({"", "mov ebx, "}), i(2, "1"),
          t({"", "mov ecx, "}), i(3, "msg"), t({"", "mov edx, "}), i(4, "len"),
          t({"", "int 0x80"})
        }),

        s("data", {
          i(1, "msg"), t(" db \""), i(2, "текст"), t("\", 0xA, 0"),
          t({"", ""}), i(1, "msg"), t("_len = $ - "), i(1, "msg")
        })
      })
    end
  },

  -- Компиляция и запуск FASM
  {
    "tpope/vim-dispatch", -- Опционально: для асинхронной компиляции
    ft = "asm",
    config = function()
      -- Создаем пользовательские команды
      vim.api.nvim_create_user_command("FasmCompile", function()
        local filename = vim.fn.expand("%:p")
        local output = vim.fn.expand("%:p:r")
        vim.cmd("!fasm " .. filename .. " " .. output)
        print("Скомпилировано: " .. output)
      end, {})

      vim.api.nvim_create_user_command("FasmRun", function()
        local output = vim.fn.expand("%:p:r")
        vim.cmd("!chmod +x " .. output .. " && ./" .. output)
      end, {})

      vim.api.nvim_create_user_command("FasmBuildRun", function()
        local filename = vim.fn.expand("%:p")
        local output = vim.fn.expand("%:p:r")
        vim.cmd("!fasm " .. filename .. " " .. output .. " && chmod +x " .. output .. " && ./" .. output)
      end, {})

      -- Автокоманды для asm файлов
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "asm",
        callback = function()
          -- Быстрые клавиши
          vim.keymap.set('n', '<leader>fc', ':FasmCompile<CR>', 
            { buffer = true, desc = "Скомпилировать FASM" })
          vim.keymap.set('n', '<leader>fr', ':FasmRun<CR>', 
            { buffer = true, desc = "Запустить FASM" })
          vim.keymap.set('n', '<leader>fb', ':FasmBuildRun<CR>', 
            { buffer = true, desc = "Собрать и запустить" })
        end
      })
    end
  }
}
