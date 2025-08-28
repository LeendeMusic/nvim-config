-- ­üÞÃ×-š

-- Telescope keymaps
vim.keymap.set('n', ';f', '<cmd>Telescope find_files hidden=true<cr>')
vim.keymap.set('n', ';r', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '\\\\', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', ';t', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', ';;', '<cmd>Telescope resume<cr>')
vim.keymap.set('n', ';e', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', 'sf', '<cmd>Telescope file_browser<cr>')