return {
  -- add Lua-scriptable solarized color scheme
  {
    "maxmx03/solarized.nvim",
    branch = "main",
    lazy = false,
    name = "solarized",
    main = "solarized",
    priority = 1000,
    -- See: https://www.lazyvim.org/configuration/plugins#%EF%B8%8F-customizing-plugin-specs
    opts = {
      -- See: https://github.com/maxmx03/solarized.nvim/blob/main/lua/solarized/palette.lua
      palette = "selenized",
      -- See: https://github.com/maxmx03/solarized.nvim?tab=readme-ov-file#default-config
      styles = {
        keywords = { bold = false },
      },
      enables = {
        -- For indentblankline ("ibl"), the default highlight colors that comes
        -- with this colorscheme is too dark for my taste; tweak in the
        -- `highlights` table below.
        indentblankline = false,
      },
      highlights = function(colors)
        return {
          -- Highlight of indent character.
          IblIndent = { fg = colors.base01, nocombine = true },
          -- Highlight of indent character when base of current context.
          IblScope = { fg = colors.base02, nocombine = true },
        }
      end,
    },
    config = function(plugin, opts)
      vim.o.background = "dark"
      require(plugin.main).setup(opts)
      vim.cmd.colorscheme = "solarized"
    end,
  },

  -- configure LazyVim to load solarized
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
