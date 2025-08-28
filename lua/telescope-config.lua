-- Telescope setup
local status_telescope, telescope = pcall(require, "telescope")
if (not status_telescope) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

