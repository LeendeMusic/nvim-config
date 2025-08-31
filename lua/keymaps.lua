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

-- Lazygit keymap
vim.keymap.set('n', '<leader>gg', function()
  -- Set English language for LazyGit
  vim.env.LANG = 'en_US.UTF-8'
  vim.env.LC_ALL = 'en_US.UTF-8'
  
  -- Get current file directory first
  local current_file = vim.fn.expand('%:p')
  if current_file ~= '' then
    local file_dir = vim.fn.expand('%:p:h')
    vim.cmd('cd ' .. vim.fn.fnameescape(file_dir))
  end
  
  -- Find git root directory
  local git_root = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
  if vim.v.shell_error == 0 then
    -- Change to git root before opening lazygit
    vim.cmd('cd ' .. vim.fn.fnameescape(git_root))
    vim.cmd('LazyGit')
  else
    print('Not in a git repository')
  end
end, { desc = 'Open LazyGit in English' })