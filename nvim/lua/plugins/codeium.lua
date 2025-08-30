return {
 {
    "Exafunction/codeium.vim",
    lazy = false, -- Загружается сразу (не лениво)
    config = function()
      -- Отключаем стандартное управление Tab, чтобы не конфликтовало с другими плагинами
      vim.g.codeium_no_map_tab = 1

      -- Настройка горячих клавиш
      vim.keymap.set("i", "<C-l>", function()
       return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-д>", function()
       return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-j>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<C-k>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
}
