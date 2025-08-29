vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --
  -- この下にインストールするプラグインを記載します。
  use 'folke/tokyonight.nvim'
  
  -- Web devicons (先にインストール)
  use 'nvim-tree/nvim-web-devicons'

  -- ステータスライン
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Treesitter (runコマンドを削除)
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
        },
      }
    end
  }

  -- Cursorline
  use 'yamatsum/nvim-cursorline'

  -- Tmux integration
  use {
    'christoomey/vim-tmux-navigator',
    config = function()
      -- キーマップは自動で設定されます
      -- <C-h>, <C-j>, <C-k>, <C-l> でtmux pane間を移動
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Telescope file browser
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '-' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false,
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        on_attach = function(bufnr)
          print("Gitsigns attached to buffer: " .. bufnr .. " file: " .. vim.api.nvim_buf_get_name(bufnr))
        end,
      })
    end
  }

  use 'tpope/vim-fugitive'

end)
