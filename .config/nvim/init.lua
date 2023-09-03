vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>j', function() vim.cmd.wincmd('j') end)
vim.keymap.set('n', '<leader>k', function() vim.cmd.wincmd('k') end)
vim.keymap.set('n', '<leader>h', function() vim.cmd.wincmd('h') end)
vim.keymap.set('n', '<leader>l', function() vim.cmd.wincmd('l') end)
vim.keymap.set('n', '<leader>o', function() vim.cmd.wincmd('o') end)
vim.keymap.set('n', '<leader>[', vim.cmd.bp)
vim.keymap.set('n', '<leader>]', vim.cmd.bn)

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
      'simnalamburt/vim-mundo',
      config = function()
        vim.opt.undofile = true
        vim.keymap.set('n', '<leader>u', vim.cmd.MundoToggle)
      end,
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
  })
end
