-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.lsp.inlay_hint.enable(false)

vim.opt.relativenumber = false
vim.opt.number = false
vim.opt.spell = false
vim.opt.spelllang = {}
vim.opt_local.spell = false
vim.opt_local.spelllang = {}

vim.o.cursorline = false

vim.opt.startofline = false
vim.opt.virtualedit = "all"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
--vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+yy', { noremap = true, silent = true })

vim.opt.list = false

-- OS clipboard and vim yank are diff
-- with unnamedplus unify clipboard
vim.opt.clipboard = "unnamed"

-- Disable LazyVim auto format
vim.g.autoformat = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.defer_fn(function()
      vim.opt_local.concealcursor = "n"
      vim.opt_local.wrap = false
    end, 200)
  end,
})
