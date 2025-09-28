return {
  -- Менеджер для установки LSP серверов
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  -- Автоматическая настройка LSP серверов
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "marksman" } -- Только clangd для C++
      })
    end
  },


  -- Настройка LSP клиента
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local home = os.getenv("HOME")
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Добавьте эту строку
      
      -- Функция для создания симлинков
      local function create_config_links()
        local project_dir = vim.fn.getcwd()
        
        -- Создаем симлинк для .clang-tidy
        local tidy_source = home .. "/.clang-tidy"
        local tidy_target = project_dir .. "/.clang-tidy"
        
        if vim.fn.filereadable(tidy_source) == 1 and vim.fn.filereadable(tidy_target) == 0 then
          os.execute("ln -sf " .. tidy_source .. " " .. tidy_target)
          print("Created symlink: " .. tidy_target .. " -> " .. tidy_source)
        end
        
        -- Создаем симлинк для .clang-format
        local format_source = home .. "/.clang-format"
        local format_target = project_dir .. "/.clang-format"
        
        if vim.fn.filereadable(format_source) == 1 and vim.fn.filereadable(format_target) == 0 then
          os.execute("ln -sf " .. format_source .. " " .. format_target)
          print("Created symlink: " .. format_target .. " -> " .. format_source)
        end
      end
      
      -- Автоматически создаем симлинки при открытии C++ файлов
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.cpp,*.hpp,*.c,*.h",
        callback = create_config_links,
        once = true, -- Только один раз за сессию
      })
      
      -- Простая настройка clangd
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
        }
      })

lspconfig.marksman.setup({
  capabilities = capabilities,
  filetypes = { "markdown" }
})
      
      -- Включить диагностику (показ ошибок)
      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
      })

      -- Автоформатирование при сохранении C++ файлов
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.cpp,*.hpp,*.c,*.h",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
      
      -- Показываем уведомление о создании симлинков
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.expand("%:e") == "cpp" or vim.fn.expand("%:e") == "hpp" or 
             vim.fn.expand("%:e") == "c" or vim.fn.expand("%:e") == "h" then
            create_config_links()
          end
        end,
      })
    end
  }
}
