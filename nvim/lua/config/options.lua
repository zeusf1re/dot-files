vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
-- Использование системного буфера обмена
vim.opt.clipboard = "unnamedplus" -- Теперь 'y'/'p' работают с системным буфером

-- Если Wayland (wl-copy/wl-paste)
if os.getenv("WAYLAND_DISPLAY") then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --primary --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline --primary",
    },
    cache_enabled = true,
  }
-- Если X11 (xclip)
else
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = true,
  }
end


vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "#1F1F28", fg = "#DCD7BA" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#7E9CD8" })
vim.opt.number = true           -- Показывать номера строк
vim.opt.relativenumber = true   -- Относительные номера строк
