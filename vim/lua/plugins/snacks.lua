return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- for hidden files
        ignored = false, -- for .gitignore files

        exclude = {
          "libs/raylib/*", -- project specific
          "*.gd.uid",
          "*.gdshader.uid",
          "*.gdextension.uid",
          "*.import",
        },
      },
    },
  },
}
