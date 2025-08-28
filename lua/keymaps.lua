-- �����-�

-- Telescope keymaps
vim.keymap.set('n', ';f', function()
  require('telescope.builtin').find_files({
    hidden = true,
    no_ignore = false
  })
end)
vim.keymap.set('n', ';r', function()
  require('telescope.builtin').live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  require('telescope.builtin').buffers()
end)
vim.keymap.set('n', ';t', function()
  require('telescope.builtin').help_tags()
end)
vim.keymap.set('n', ';;', function()
  require('telescope.builtin').resume()
end)
vim.keymap.set('n', ';e', function()
  require('telescope.builtin').diagnostics()
end)
vim.keymap.set('n', 'sf', function()
  require('telescope').extensions.file_browser.file_browser({
    path = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)