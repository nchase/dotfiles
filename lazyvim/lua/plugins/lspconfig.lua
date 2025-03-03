-- https://github.com/yioneko/vtsls/issues/195
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
        },
      },
    },
  },
}
