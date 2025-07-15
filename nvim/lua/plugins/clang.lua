return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          capabilities = {
            offsetEncoding = "utf-8",
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--clang-tidy-checks=*",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--header-insertion=never",
            "--query-driver=/usr/bin/clang++",
          },
        },
      },
    },
  },
}
