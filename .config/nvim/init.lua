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
vim.opt.signcolumn = 'yes'

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
      'hrsh7th/cmp-nvim-lsp',
      dependencies = {
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
            cmp.setup({
              mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                  local col = vim.fn.col('.') - 1

                  if cmp.visible() then
                    cmp.select_next_item({behavior = 'insert'})
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'insert'}),
              }),
              matching = {
                disallow_fuzzy_matching = true,
                disallow_partial_matching = true,
              },
              sources = {
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
                {name = 'path'},
                {name = 'buffer'},
              },
              snippet = {
                expand = function(args)
                  vim.snippet.expand(args.body)
                end,
              },
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
              }),
            })
          end,
        },
        'neovim/nvim-lspconfig',
      },
      config = function()
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
          'force',
          lspconfig_defaults.capabilities,
          require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
          desc = 'LSP actions',
          callback = function(event)
            local opts = {buffer = event.buf}

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          end,
        })

        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
            'eslint',
            'lua_ls',
            'pylsp',
            'terraformls',
            'tflint',
            'ts_ls',
          },
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          },
        })
      end,
    },
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
            javascript = {'prettierd', 'prettier', stop_after_first = true},
            python = {'autoflake', 'isort', 'black'},
            terraform = {'terraform_fmt'},
            typescript = {'prettierd', 'prettier', stop_after_first = true},
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
      end,
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({})
      end,
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
        vim.keymap.set('n', '<leader>u', vim.cmd.MundoToggle)
      end,
    },
  })
end
