vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>j', function() vim.cmd.wincmd('j') end)
vim.keymap.set('n', '<leader>k', function() vim.cmd.wincmd('k') end)
vim.keymap.set('n', '<leader>h', function() vim.cmd.wincmd('h') end)
vim.keymap.set('n', '<leader>l', function() vim.cmd.wincmd('l') end)
vim.keymap.set('n', '<leader>o', function() vim.cmd.wincmd('o') end)
vim.keymap.set('n', '<leader>[', vim.cmd.bp)
vim.keymap.set('n', '<leader>]', vim.cmd.bn)

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true

local lazypath = vim.fn.expand('$HOME/.modules/lazy.nvim')
vim.opt.rtp:prepend(lazypath)
if vim.loop.fs_stat(lazypath) then
  require('lazy').setup({
    {
      'ibhagwan/fzf-lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        local fzfLua = require('fzf-lua')
        fzfLua.setup({
          'telescope',
          winopts = {
            preview = {
              default = 'bat',
            },
          },
        })
        vim.keymap.set('n', '<leader>b', function() fzfLua.buffers() end)
        vim.keymap.set('n', '<leader>f', function() fzfLua.live_grep_native() end)
        vim.keymap.set('n', '<leader>p', function() fzfLua.files() end)
      end,
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
      },
      config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
          lsp.default_keymaps({buffer = bufnr})
        end)

        lsp.setup_servers({'eslint', 'lua_ls', 'pyright', 'terraformls', 'tflint', 'tsserver'})

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
      end
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
      end,
      config = function()
        require('nvim-treesitter.configs').setup({
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        })
      end,
    },
    {
      'navarasu/onedark.nvim',
      config = function ()
        require('onedark').load()
      end,
    },
    {
      'simnalamburt/vim-mundo',
      config = function()
        vim.opt.undofile = true
        vim.keymap.set('n', '<leader>u', vim.cmd.MundoToggle)
      end,
    },
  })
end
