return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",  -- Стиль окна команд
          opts = {}, 
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
          }
        },
        messages = {
          enabled = true,
          view = "notify",
        },
      })
    end
  }
}
