vim.g.mapleader = ' '
vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.termguicolors = true

vim.opt.grepprg='rg --vimgrep --smart-case'
vim.opt.undofile = true

vim.api.nvim_create_autocmd({'BufWritePre', 'FileWritePre'}, {
  pattern = '*',
  callback = function()
    local file_path = vim.fn.expand('<afile>:p:h')
    if not(file_path:match('.*://')) then
      vim.fn.mkdir(file_path, 'p')
    end
  end
})

vim.keymap.set('n', '<leader>j', function() vim.cmd.wincmd('j') end)
vim.keymap.set('n', '<leader>k', function() vim.cmd.wincmd('k') end)
vim.keymap.set('n', '<leader>h', function() vim.cmd.wincmd('h') end)
vim.keymap.set('n', '<leader>l', function() vim.cmd.wincmd('l') end)
vim.keymap.set('n', '<leader>o', function() vim.cmd.wincmd('o') end)
vim.keymap.set('n', '<leader>[', vim.cmd.bp)
vim.keymap.set('n', '<leader>]', vim.cmd.bn)
vim.keymap.set('n', '<c-n>', vim.diagnostic.goto_next)
vim.keymap.set('n', '<c-p>', vim.diagnostic.goto_prev)

local lazy_path = vim.fn.expand('$HOME/.modules/lazy.nvim')
vim.opt.rtp:prepend(lazy_path)
if vim.loop.fs_stat(lazy_path) then
  require('lazy').setup({
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          toggler = {
            line = 'g/l',
            block = 'g/bl',
          },
          opleader = {
            line = 'g/',
            block = 'g/b',
          },
          extra = {
            above = 'g/O',
            below = 'g/o',
            eol = 'g/A',
          },
        })
      end,
    },
    {
      'stevearc/conform.nvim',
      config = function()
        require('conform').setup({
          format_on_save = {},
          formatters_by_ft = {
            ['_'] = {'trim_newlines', 'trim_whitespace'},
            javascript = {{'prettierd', 'prettier'}},
            python = {'autoflake', 'isort', 'black'},
            terraform = {'terraform_fmt'},
            typescript = {{'prettierd', 'prettier'}},
          },
        })
      end,
    },
    {
      'ibhagwan/fzf-lua',
      dependencies = {'nvim-tree/nvim-web-devicons'},
      config = function()
        local fzf_lua = require('fzf-lua')

        fzf_lua.setup({
          'telescope',
          winopts = {
            preview = {
              default = 'bat',
            },
          },
        })

        vim.keymap.set('n', '<leader>b', function() fzf_lua.buffers() end)
        vim.keymap.set('n', '<leader>f', function() fzf_lua.live_grep_native() end)
        vim.keymap.set('n', '<leader>p', function() fzf_lua.files() end)
      end,
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        {
          'hrsh7th/nvim-cmp',
          dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
          },
          config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
              mapping = {
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
              },
              matching = {
                disallow_fuzzy_matching = true,
                disallow_partial_matching = true,
              },
              sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
                {name = 'path'},
                {name = 'buffer'},
              }),
            })

            cmp.setup.cmdline({'/', '?'}, {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                {name = 'buffer'},
              },
            })

            cmp.setup.cmdline(':', {
              mapping = cmp.mapping.preset.cmdline(),
              sources = cmp.config.sources({
                {name = 'path'},
              },
              {
                {
                  name = 'cmdline',
                  option = {
                    ignore_cmds = {'Man', '!'},
                  },
                },
              })
            })
          end
        },
        'L3MON4D3/LuaSnip',
      },
      config = function()
        local lsp_zero = require('lsp-zero').preset({})

        lsp_zero.on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

        lsp_zero.ensure_installed({
          'eslint',
          'lua_ls',
          'pylsp',
          'terraformls',
          'tflint',
          'tsserver',
        })

        require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

        lsp_zero.setup()
      end
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {'nvim-tree/nvim-web-devicons'},
      config = function()
        require('lualine').setup({
          options = {
            component_separators = '',
            section_separators = '',
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {
              {
                'branch',
                icon = '',
                cond = function()
                  return vim.api.nvim_win_get_width(0) > 120
                end
              },
              'diagnostics',
            },
            lualine_c = {
              {
                'filename',
                path = 3,
              },
            },
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'progress'},
            lualine_y = {'location'},
            lualine_z = {}
          },
        })
      end
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({})
      end
    },
    {
      'kylechui/nvim-surround',
      version = '*',
      event = 'VeryLazy',
      config = function()
        require('nvim-surround').setup({
          move_cursor = false,
        })
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
          indent = {
            enable = true,
          },
        })
      end,
    },
    {
      'stevearc/oil.nvim',
      dependencies = {'nvim-tree/nvim-web-devicons'},
      config = function()
        local oil = require('oil')
        oil.setup({
          view_options = {
            show_hidden = true
          },
          keymaps = {
            ['gq'] = 'actions.close',
          },
        })
        vim.keymap.set('n', '-', vim.cmd.Oil)
      end
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
        vim.keymap.set('n', '<leader>u', vim.cmd.MundoToggle)
      end,
    },
  })
end
