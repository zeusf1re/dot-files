return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = {
      default = {
        replace = { esc = false }, -- Не экранировать спецсимволы
      },
    },
    -- Горячие клавиши
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
    },
  },
}
