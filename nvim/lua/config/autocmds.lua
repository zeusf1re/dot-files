-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
return {
  {
    event = "BufWritePre",
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function(args)
      local util = require("conform.util")
      if util.format_is_available({ "clang-format" }) then
        vim.cmd(
          ":silent !clang-format -i --style=file:"
            .. os.getenv("HOME")
            .. "~/.config/clang/.clang-format "
            .. vim.fn.shellescape(args.file)
        )
      end
    end,
  },
}
