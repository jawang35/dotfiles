vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>')
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>')
vim.keymap.set('n', '<leader>h', ':wincmd h<cr>')
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>')
vim.keymap.set('n', '<leader>o', ':wincmd o<cr>')
vim.keymap.set('n', '<leader>[', ':bp<cr>')
vim.keymap.set('n', '<leader>]', ':bn<cr>')

local lazypath = vim.fn.expand('$HOME/.modules/lazy.nvim')
vim.opt.rtp:prepend(lazypath)
if vim.loop.fs_stat(lazypath) then
  require('lazy').setup({
    {
      'ibhagwan/fzf-lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('fzf-lua').setup({
          'telescope',
          winopts = {
            preview = {
              default = "bat",
            },
          },
        })
      end,
    },
  })
end

vim.keymap.set('n', '<leader>b', function() require('fzf-lua').buffers() end)
vim.keymap.set('n', '<leader>f', function() require('fzf-lua').live_grep_native() end)
vim.keymap.set('n', '<leader>p', function() require('fzf-lua').files() end)
