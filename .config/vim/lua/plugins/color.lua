return {

  --{
  --  "AlexvZyl/nordic.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    require("nordic").load()
  --  end,
  --},

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        options = {
          cursorline = false, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          lualine_transparency = true, -- Center bar transparency?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      })
      vim.cmd([[colorscheme onedark]])
      vim.cmd([[highlight WinSeparator guifg=#252738 guibg=0]])
    end,
  },

  --{
  --  "tiagovla/tokyodark.nvim",
  --  opts = {
  --    transparent_background = false, -- set background to transparent
  --    gamma = 1.00, -- adjust the brightness of the theme
  --    styles = {
  --      comments = { italic = true }, -- style for comments
  --      keywords = { italic = true }, -- style for keywords
  --      identifiers = { italic = true }, -- style for identifiers
  --      functions = {}, -- style for functions
  --      variables = {}, -- style for variables
  --    },
  --    custom_highlights = {} or function(highlights, palette)
  --      return {}
  --    end, -- extend highlights
  --    custom_palette = {} or function(palette)
  --      return {}
  --    end, -- extend palette
  --    terminal_colors = true, -- enable terminal colors
  --  },
  --  config = function(_, opts)
  --    require("tokyodark").setup(opts) -- calling setup is optional
  --    vim.cmd([[colorscheme tokyodark]])
  --  end,
  --},

  --{
  --  "navarasu/onedark.nvim",
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    -- Lua
  --    require("onedark").setup({
  --      -- Main options --
  --      style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --      transparent = true, -- Show/hide background
  --      term_colors = true, -- Change terminal color as per the selected theme style
  --      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  --      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  --      -- toggle theme style ---
  --      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

  --      -- Change code style ---
  --      -- Options are italic, bold, underline, none
  --      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --      code_style = {
  --        comments = "italic",
  --        keywords = "none",
  --        functions = "none",
  --        strings = "none",
  --        variables = "none",
  --      },

  --      -- Lualine options --
  --      lualine = {
  --        transparent = true, -- lualine center bar transparency
  --      },

  --      -- Custom Highlights --
  --      colors = {}, -- Override default colors
  --      highlights = {}, -- Override highlight groups

  --      -- Plugins Config --
  --      diagnostics = {
  --        darker = false, -- darker colors for diagnostic
  --        undercurl = false, -- use undercurl instead of underline for diagnostics
  --        background = false, -- use background color for virtual text
  --      },
  --    })
  --    -- Enable theme
  --    require("onedark").load()
  --  end,
  --},

  --{
  --  "LazyVim/LazyVim",
  --  opts = {
  --    colorscheme = "default",
  --  },
  --},
}
