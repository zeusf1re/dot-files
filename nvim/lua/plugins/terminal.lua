return {{
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
    { "<leader>tf", "<cmd>ToggleTerm<cr>", desc = "Fullscreen terminal" },
    { "<C-\\>", "<cmd>ToggleTerm<cr>", mode = {"n", "t"}, desc = "Toggle terminal" },
  },
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
      -- Режимы как в eshell
      on_open = function(term)
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = term.bufnr })
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = term.bufnr })
        vim.keymap.set("n", "i", "a", { buffer = term.bufnr })
      end,
    })
  end
},
}
