return {{
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true, -- Показывать скрытые файлы
        },
      },

window = {
  width = 28,  -- Можно уменьшить до 25
  position = "right",  -- Или "right" для правой панели
  popup = {  -- Для плавающего режима
    size = { height = "80%", width = "40%" },
  }
},
    })
  end,
},
}
