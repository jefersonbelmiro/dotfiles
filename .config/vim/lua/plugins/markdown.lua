return {

  -- for read markdown
  -- to disable/restore edit markdown on cursor:
  -- off :   set concealcursor=n
  -- on  :   set concealcursor=

  --{
  --  "MeanderingProgrammer/render-markdown.nvim",
  --  enabled = false,
  --},

  --{
  --  "nvim-treesitter/nvim-treesitter",
  --  opts = {
  --    highlight = {
  --      disable = { "markdown" },
  --    },
  --  },
  --  config = function(_, opts)
  --    require("nvim-treesitter.configs").setup(opts)
  --  end,
  --},

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
}
