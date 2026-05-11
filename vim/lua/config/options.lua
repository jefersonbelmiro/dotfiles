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
-- vim.opt.clipboard = "unnamed"
vim.opt.clipboard = ""

local function is_wsl()
    -- Check for WSL-specific environment variables
    if vim.fn.exists('$WSL_DISTRO_NAME') == 1 or vim.fn.exists('$WSL_INTEROP') == 1 then
        return true
    end

    -- Fallback: Check proc version for "microsoft/WSL"
    local handle = io.open("/proc/version", "r")
    if handle then
        local content = handle:read("*all")
        handle:close()
        if content:match("microsoft") or content:match("WSL") then
            return true
        end
    end

    return false
end

if is_wsl then
  vim.g.clipboard = {
    name = "Win32Yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",

      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

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
