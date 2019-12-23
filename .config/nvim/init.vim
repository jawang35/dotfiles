" Neovim defaults for Vim {{{
set nocompatible
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
" }}}

" Miscellaneous defaults {{{
set foldmethod=marker

" Disable modeline to prevent unpredictable behavior
set nomodeline

" Bash style autocompletion
set wildmode=list:longest

" Highlight current line
set cursorline

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show relative line numbers
set number
set relativenumber

" 4 space tabs
set tabstop=4
set shiftwidth=4

" Spaces > tabs
set expandtab

" Indentations snap to multiple of shift width
set shiftround

" Disable vim-go version warning
let g:go_version_warning = 0

" Leader
let mapleader="\<Space>"
" }}}

" Plugins {{{
" Disable Python 2
let g:loaded_python_provider = 0

" Default Python 3 path to ensure pynvim exists when changing environments
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.config/nvim/plugged')
Plug '~/.modules/onehalf/vim'

Plug 'bling/vim-bufferline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'justinmk/vim-dirvish'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

if v:progname == 'nvim'
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/echodoc'
    Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' }
    Plug 'w0rp/ale'
endif
call plug#end()
" }}}

" Undo (Mundo), swap, backup {{{
" Undo history
set undofile

" Centralized swap, backup, undo files
set backupdir=~/.local/share/vim/backup//
set directory=~/.local/share/vim/swap//
set undodir=~/.local/share/vim/undo//

let g:mundo_prefer_python3 = 1
nnoremap <silent><leader>u :MundoToggle<CR>
" }}}

" Pane/buffer management {{{
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Natural splitting
set splitbelow
set splitright

nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>o <C-w><C-o>

nnoremap <silent><leader>[ :bp<CR>
nnoremap <silent><leader>] :bn<CR>

" Create intermediate directories that don't already exist
" https://github.com/justinmk/vim-dirvish/issues/38
au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
" }}}

" Searching {{{
" Disable search highlighting
set nohlsearch

" Smart case searching
set ignorecase
set smartcase

" Search behaves like grep
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Better grepping
if executable('rg')
    " Use ripgrep for faster grepping
    set grepprg=rg\ --vimgrep\ --smart-case
else
    set grepprg=grep\ -nr\ $*\ /dev/null
endif
" }}}

" Linting and formatting (ALE) {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ }
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
" }}}

" Colors (onehalf-dark) {{{
if exists('+termguicolors') && ($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
syntax on
colorscheme onehalfdark
" }}}

" Commenting (commentary) {{{
map g/ gc
" }}}

" Fuzzy file finding (CtrlP) {{{
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_root_markers = ['environment.yml', 'Gopkg.toml', 'Makefile', 'package.json', 'requirements.txt']
let g:webdevicons_enable_ctrlp = 1

if executable('rg')
    " Use ripgrep for faster searching
    let g:ctrlp_user_command = 'rg %s --files --hidden --vimgrep --glob ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif
" }}}

" Autocompletion (deoplete/echodoc) {{{
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1

" Use echodoc to move autocompletion preview window to command line
set completeopt-=preview
let g:echodoc_enable_at_startup = 1

" Tab through pop-up menus
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" }}}

" Status bar and buffers (lightline/bufferline) {{{
" Hide command and mode on command line
set noshowcmd
set noshowmode

set showtabline=2
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ' '
let g:bufferline_active_buffer_right = ' '

" Buffers in tabsline
function! LightlineBufferline()
    call bufferline#refresh_status()
    return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after ]
endfunction

function! LightlineFileFormat()
    return WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat
endfunction

" Truncate filepath on narrow panes
function! LightlineFilePath()
    if winwidth(0) < 120
        return expand('%:t')
    endif

    let home = fnamemodify('~', ':p:h')
    let abspath = substitute(expand('%:p'), home, '~', '')
    if abspath ==# ''
        return '[No Name]'
    endif

    let filepath = split(abspath, '/')

    if len(filepath) > 3
        return '⋯/' . join(filepath[-3:], '/')
    endif

    return join(filepath, '/')
endfunction

function! LightlineFileType()
    return strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft'
endfunction

function! LightlineGitBranch()
    if winwidth(0) < 120
        return ''
    endif
    let branchname = gitbranch#name()
    return strlen(branchname) ? ' ' . branchname : ''
endfunction

let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'tabline': {
    \   'left': [ [ 'bufferline' ] ],
    \   'right': [ [] ] },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filepath', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'gitbranch', 'fileformat', 'filetype' ] ] },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ] },
    \ 'component_expand': { 'bufferline': 'LightlineBufferline' },
    \ 'component_type': { 'bufferline': 'tabsel' },
    \ 'component_function': { 'fileformat': 'LightlineFileFormat',
    \                         'filepath': 'LightlineFilePath',
    \                         'filetype': 'LightlineFileType',
    \                         'gitbranch': 'LightlineGitBranch'},
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' } }
" }}}
