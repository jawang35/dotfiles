" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Neovim defaults for Vim
set autoindent
set autoread
set backspace=indent,eol,start
set complete-=i
set display=lastline
set encoding=utf-8
set formatoptions=tcqj
set history=10000
set hlsearch
set incsearch
if exists('+langnoremap')
    set langnoremap
endif
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set mouse=a
set nrformats=hex
set sessionoptions-=options
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!
set wildmenu
" End Neovim defaults

" Disable modeline to prevent unpredictable behavior
set nomodeline

" Undo history
set undofile

" Centralized swap, backup, undo files
set backupdir=~/.local/share/vim/backup//
set directory=~/.local/share/vim/swap//
set undodir=~/.local/share/vim/undo//

" Bash style autocompletion
set wildmode=list:longest

" Hide command and mode on command line
set noshowcmd
set noshowmode

" Disable search highlighting
set nohlsearch

" Highlight current line
set cursorline

" Smart case searching
set ignorecase
set smartcase

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show relative line numbers
set number
set relativenumber

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" 4 space tabs
set tabstop=4
set shiftwidth=4

" Spaces > tabs
set expandtab

" Indentations snap to multiple of shift width
set shiftround

" Natural splitting
set splitbelow
set splitright

" Create intermediate directories that don't already exist
au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')

" Leader
let mapleader="\<Space>"

" Pane management
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>o <C-W><C-O>

" Buffer management
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>

" Search behaves like grep
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Use ripgrep for faster searching
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
    let g:ctrlp_user_command = 'rg %s --files --hidden --vimgrep --glob ""'
    let g:ctrlp_use_caching = 0
endif

" Default Python paths to ensure pynvim exists when changing environments
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Pathogen
function PathogenInfect(filetype)
    execute pathogen#infect('bundles/vim/' . a:filetype . '/{}')
    if v:progname == 'nvim'
        execute pathogen#infect('bundles/nvim/' . a:filetype . '/{}')
    endif
endfunction
execute PathogenInfect('all')

" ALE (Asynchronous Lint Engine)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" commentary.vim
map g/ gc

" CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_root_markers = ['environment.yml', 'Gopkg.toml', 'Makefile', 'package.json', 'requirements.txt']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" deoplete.nvim
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
" Use echodoc to move autocompletion preview window to command line
set completeopt-=preview
let g:echodoc_enable_at_startup = 1
" Tab through pop-up menus
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Golang
let g:go_version_warning = 0

" Lightline
set showtabline=2
let g:bufferline_echo = 0
let g:lightline = {
    \ 'colorscheme': 'PaperColor_light',
    \ 'tabline': {
    \   'left': [ [ 'bufferline' ] ],
    \   'right': [ [] ]
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filepath', 'modified' ] ],
    \ },
    \ 'component_expand': {
    \   'bufferline': 'LightlineBufferline',
    \ },
    \ 'component_type': {
    \   'bufferline': 'tabsel',
    \ },
    \ 'component_function': {
    \   'filepath': 'LightlineFilepath'
    \ }
    \ }

function! LightlineBufferline()
    call bufferline#refresh_status()
    return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after ]
endfunction
" Truncate filepath on narrow panes
function! LightlineFilepath()
    if winwidth(0) < 120
        return expand('%')
    endif

    let home = fnamemodify('~', ':p:h')
    let abspath = substitute(expand('%:p'), home, '~', '')
    if abspath ==# ''
        return '[No Name]'
    endif

    let filepath = split(abspath, '/')
    if len(filepath) > 3
        return '⋯ /' . join(filepath[-3:], '/')
    endif

    return join(filepath, '/')
endfunction

" Minimalist color scheme
set t_Co=256
syntax on
colorscheme minimalist

" Terraform
let g:terraform_fmt_on_save = 1

" Promptline bash status bar
" Uncomment and run :PromptlineSnapshot! ../bash/.shell_prompt.sh
" execute pathogen#infect('bundles/utils/promptline.vim')
" let g:promptline_theme = 'lightline'
" let g:promptline_preset = {
" 	\ 'a'   : [ promptline#slices#user() ],
" 	\ 'b'   : [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
" 	\ 'c'   : [ promptline#slices#vcs_branch() ],
" 	\ 'warn': [ promptline#slices#last_exit_code() ],
" 	\ }
" let g:promptline_powerline_symbols = 0

" tmuxline
" Uncomment and run :Tmuxline
" execute pathogen#infect('bundles/utils/tmuxline.vim')
" let g:tmuxline_theme = 'lightline'
" let g:tmuxline_powerline_separators = 0
