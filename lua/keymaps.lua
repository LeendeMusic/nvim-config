-- キーマップ設定

-- Check if Telescope is available
local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then
  vim.notify("Telescope not found", vim.log.levels.ERROR)
  return
end

local builtin_ok, builtin = pcall(require, 'telescope.builtin')
if not builtin_ok then
  vim.notify("Telescope builtin not found", vim.log.levels.ERROR)
  return
end

-- Telescope keymaps
vim.keymap.set('n', ';f', function()
  builtin.find_files({
    hidden = true,
    no_ignore = false
  })
end)

vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)

vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)

vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)

vim.keymap.set('n', ';;', function()
  builtin.resume()
end)

vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)