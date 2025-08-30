return {
  {
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
        -- Исправляем window на win
      })
    end
  }
}
