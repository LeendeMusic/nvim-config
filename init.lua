-- Set Packer cache directory to avoid permission issues
vim.env.XDG_CACHE_HOME = vim.fn.expand("~/cache")

require("options")
require("plugins")
require("telescope-config")
require("keymaps")

-- lualine setup
local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- Custom lualine theme matching background
local custom_theme = {
  normal = {
    a = { fg = '#1e1e1e', bg = '#a7c080', gui = 'bold' },
    b = { fg = '#a7c080', bg = '#3e4452' },
    c = { fg = '#abb2bf', bg = '#282c34' },
  },
  insert = {
    a = { fg = '#1e1e1e', bg = '#61afef', gui = 'bold' },
    b = { fg = '#61afef', bg = '#3e4452' },
  },
  visual = {
    a = { fg = '#1e1e1e', bg = '#c678dd', gui = 'bold' },
    b = { fg = '#c678dd', bg = '#3e4452' },
  },
  replace = {
    a = { fg = '#1e1e1e', bg = '#e06c75', gui = 'bold' },
    b = { fg = '#e06c75', bg = '#3e4452' },
  },
  command = {
    a = { fg = '#1e1e1e', bg = '#e5c07b', gui = 'bold' },
    b = { fg = '#e5c07b', bg = '#3e4452' },
  },
  inactive = {
    a = { fg = '#5c6370', bg = '#282c34' },
    b = { fg = '#5c6370', bg = '#282c34' },
    c = { fg = '#5c6370', bg = '#282c34' },
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    section_separators = { left = '', right = '' },
    component_separators = { left = '│', right = '│' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 
      'branch',
      {
        'diff',
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed, 
              removed = gitsigns.removed
            }
          end
        end,
        symbols = { added = '+', modified = '~', removed = '-' },
        color_added = '#a7c080',
        color_modified = '#ffdf1b', 
        color_removed = '#ff6666'
      }
    },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' ' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}

