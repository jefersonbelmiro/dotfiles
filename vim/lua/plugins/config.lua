return {

  -- disable inline hints
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      words = {
        enabled = false, -- disable cursor world highlight
      },
      indent = {
        enabled = false,
      },
      -- disable smoth scroll
      --scroll = { enabled = false },
      --
      terminal = {
        win = {
          style = "terminal",
          wo = {
            winbar = "",
          },
        },
        -- your terminal configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
  },

  -- diable buffers as tab
  --{
  --  "akinsho/bufferline.nvim",
  --  enabled = false,
  --},

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  --{
  --  "RRethy/vim-illuminate",
  --  enabled = false,
  --},
}
