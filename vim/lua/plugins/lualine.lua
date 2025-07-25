-- Example configuration
local function get_mode_abbreviation()
  -- Map of modes to their respective shorthand indicators
  local mode_map = {
    n = "N", -- Normal mode
    i = "I", -- Insert mode
    v = "V", -- Visual mode
    [""] = "V", -- Visual block mode
    V = "V", -- Visual line mode
    c = "C", -- Command-line mode
    no = "N", -- NInsert mode
    s = "S", -- Select mode
    S = "S", -- Select line mode
    ic = "I", -- Insert mode (completion)
    R = "R", -- Replace mode
    Rv = "R", -- Virtual Replace mode
    cv = "C", -- Command-line mode
    ce = "C", -- Ex mode
    r = "R", -- Prompt mode
    rm = "M", -- More mode
    ["r?"] = "?", -- Confirm mode
    ["!"] = "!", -- Shell mode
    t = "T", -- Terminal mode
  }
  -- Return the mode shorthand or [UNKNOWN] if no match
  return mode_map[vim.fn.mode()] or "[UNKNOWN]"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = get_mode_abbreviation,
            separator = { left = "" },
            right_padding = 2,
            --color = { bg = "None" },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          -- {
          --   function()
          --     return " " .. os.date("%R")
          --   end,
          --   separator = { right = "" },
          -- },
        },
      },
    },
  },
}
