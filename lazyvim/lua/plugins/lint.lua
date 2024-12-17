return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
        ["markdownlint-cli2"] = {
          args = { "--config", "/Users/Nchase1/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
