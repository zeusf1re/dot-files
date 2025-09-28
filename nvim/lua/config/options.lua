vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
-- Использование системного буфера обмена
vim.opt.clipboard = "unnamedplus" -- Теперь 'y'/'p' работают с системным буфером
vim.opt.number = true
vim.opt.relativenumber = true
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

-- Отключаем сообщения
vim.opt.shortmess:append("c") -- не показывать сообщения при дополнении
vim.opt.shortmess:append("I") -- не показывать intro message
vim.opt.shortmess:append("A") -- игнорировать swap-файлы
vim.opt.shortmess:append("a") -- сокращенные сообщения
vim.opt.shortmess:append("F") -- не показывать файл при редактировании

-- Скрываем сообщения о визуальном выделении
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "[vV\x16]*:*",
  callback = function()
    vim.opt.showmode = false
  end,
})

-- Альтернатива: полное отключение showmode
vim.opt.showmode = false
