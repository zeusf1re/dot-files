return { {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({
        icons = {
          breadcrumb = "", -- Убираем "»" в хлебных крошках
          separator = "",  -- Убираем "➜" между клавишами
          group = "",      -- Полностью убираем иконки групп
        },
        window = {
          border = "none", -- Без рамки
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 1, 2, 1, 2 },
        },
        layout = {
          height = { min = 1, max = 10 },
          spacing = 3,
          align = "center",
        },
      })

      -- ========== MARKDOWN ГРУППА ==========
      wk.register({
        m = {
          name = "Markdown", -- Главная группа
          b = { "Preview in Browser" },
          ["="] = { "Format Table" },
          -- Ссылки и списки
          l = { "Add Link", mode = "v" },
          ["-"] = { "Add Bullet" },
          ["*"] = { "Add Asterisk Bullet" },
          n = { "Add Numbered List" },
          
          -- Орфография
          s = { "Toggle Spell Check" },
        },
      }, { prefix = "<leader>" })

      -- ========== ОСНОВНЫЕ ГРУППЫ ==========
      wk.register({
        f = {
          name = "Find",
          f = { "Find Files" },
          g = { "Grep in Project" },
        },
        
        c = {
          name = "Code",
          a = { "Code Action" },
        },
        
        d = {
          name = "Diagnostics",
          d = { "Line Diagnostics" },
        },
        
        r = {
          name = "Refactor", 
          n = { "Rename" },
        },
        
        g = {
          name = "Go to",
          d = { "Definition" },
          D = { "Declaration" },
          i = { "Implementation" },
          r = { "References" },
        },
      }, { prefix = "<leader>" })

      -- ========== ОДИНОЧНЫЕ КЛАВИШИ ==========
      wk.register({
        K = { "Hover Documentation" },
        ["<C-k>"] = { "Signature Help" },
        ["[d"] = { "Prev Diagnostic" },
        ["]d"] = { "Next Diagnostic" },
      })
    end
  }
}
