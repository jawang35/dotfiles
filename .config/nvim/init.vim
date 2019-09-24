" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Consider
" set modelines=0

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
set tabpagemax=50
set tags=./tags;,tags
set ttyfast
set viminfo+=!

" Undo history
set undofile

" Mimic bash behavior for command autocompletion
set wildmenu
set wildmode=list:longest

" Hide command and mode on command line
set noshowcmd
set noshowmode

" Disable search highlighting
set nohlsearch

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

" Spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Snap shift width
set shiftround

" Use ripgrep for faster searching
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
    let g:ctrlp_user_command = 'rg %s --files --hidden --vimgrep --glob ""'
    let g:ctrlp_use_caching = 0
endif

" Leader
let mapleader="\<Space>"

" Natural splitting
set splitbelow
set splitright

" Pane management
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>o <C-W><C-O>

" Buffer management
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>

nnoremap / /\v
vnoremap / /\v

" NERDTree
nnoremap <leader>\ :NERDTreeToggle<CR>
nnoremap <leader>\| :NERDTreeFind<CR>

" Pathogen
function PathogenInfect(filetype)
    execute pathogen#infect('bundles/vim/' . a:filetype . '/{}')
    if v:progname == 'nvim'
        execute pathogen#infect('bundles/nvim/' . a:filetype . '/{}')
    endif
endfunction
execute PathogenInfect('all')

" Minimalist color scheme
set t_Co=256
syntax on
colorscheme minimalist

" CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['environment.yml', 'Gopkg.toml', 'Makefile', 'package.json', 'requirements.txt']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Commentary
map g/ gc

" Use deoplete for autocompletion
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1

" Use echodoc to move autocompletion preview window to command line
set completeopt-=preview
let g:echodoc_enable_at_startup = 1

" Tab through pop-up menus
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Default Python paths to ensure pynvim exists when changing environments
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" ALE lint on open/save only
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" ALE bindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Golang
let g:go_version_warning = 0

" Terraform
let g:terraform_fmt_on_save = 1

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
