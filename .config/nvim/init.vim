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
if exists('+inccommand')
    set inccommand=nosplit
endif
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

call plug#begin('~/.local/share/vim/plugins')
" Conditional plug install
function! PlugCond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug '~/.modules/onehalf/vim'

Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'justinmk/vim-dirvish'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Neovim plugins
Plug 'deoplete-plugins/deoplete-jedi', PlugCond(has('nvim'))
Plug 'Shougo/deoplete.nvim', PlugCond(has('nvim'))
Plug 'Shougo/echodoc', PlugCond(has('nvim'))
Plug 'simnalamburt/vim-mundo', PlugCond(has('nvim'))
Plug 'w0rp/ale', PlugCond(has('nvim'))

if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
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
" }}}

" Searching {{{
" Disable search highlighting
set nohlsearch

" Smart case searching
set ignorecase
set smartcase

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

" File management (dirvish) {{{
let g:dirvish_mode = ':sort ,^.*[\/],'
call dirvish#add_icon_fn({p -> WebDevIconsGetFileTypeSymbol(p, p[-1:] == '/')})

" Create intermediate directories that don't already exist
" https://github.com/justinmk/vim-dirvish/issues/38
au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
" }}}

" Fuzzy finding (fzf) {{{
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent><leader>b :FzfBuffers<CR>
nnoremap <silent><leader>f :FzfRg<CR>
nnoremap <silent><leader>p :FzfFiles<CR>
nnoremap <silent><leader>t :FzfTags<CR>

" Previews
command! -bang -nargs=? -complete=dir FzfFiles call fzf#vim#files(
    \ <q-args>,
    \ fzf#vim#with_preview(),
    \ <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -bang -nargs=* FzfRg call RipgrepFzf(<q-args>, <bang>0)
" }}}

" Autocompletion (deoplete/echodoc) {{{
" Silence problematic messages
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1

" Use echodoc to move autocompletion preview window to command line
set completeopt=menu,noselect
let g:echodoc_enable_at_startup = 1

" Tab through pop-up menus
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" }}}

" HTML/JSX tag closing {{{
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.ts,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.typescript'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescript': 'jsxRegion,tsxRegion',
    \ 'javascript': 'jsxRegion',
    \ }
" }}}

" Tags {{{
let g:gutentags_file_list_command = 'fd --exclude .git --type f'
let g:gutentags_exclude_filetypes = ['gitcommit']
let g:gutentags_project_root = ['environment.yml', 'Makefile', 'package.json', 'requirements.txt']
let g:gutentags_add_default_project_roots = 0
augroup GutentagsLightlineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END
" }}}

" Status and tab bars (lightline) {{{
" Hide command and mode on command line
set noshowcmd
set noshowmode
set showtabline=2

function! LightlineCWD()
    return substitute(getcwd(), $HOME, '~', '')
endfunction

function! LightlineFilePath()
    " Truncate filepath on narrow panes
    if winwidth(0) < 120
        return expand('%:t')
    endif

    let filepath = fnamemodify(expand('%'), ':~:.')
    let modifiedfilepath = substitute(filepath, $HOME, '~', '')
    if modifiedfilepath ==# ''
        return '[No Name]'
    endif

    let parts = split(modifiedfilepath, '/')

    " Shorten long file paths
    if len(parts) > 3
        return '⋯/' . join(parts[-3:], '/')
    endif

    return join(parts, '/')
endfunction

function! LightlineGitBranch()
    if winwidth(0) < 120
        return ''
    endif
    let branchname = gitbranch#name()
    return strlen(branchname) ? ' ' . branchname : ''
endfunction

function! LightlineFileInfo()
    let fileformat = WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat
    let filetype = WebDevIconsGetFileTypeSymbol() . ' ' . (strlen(&filetype) ?  &filetype : 'text')
    let parts = []

    if strlen(fileformat)
        let parts = parts + [fileformat]
    endif

    if strlen(filetype)
        let parts = parts + [filetype]
    endif

    return join(parts, ' ')
endfunction

let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'tabline': {
    \   'left': [ [ 'cwd' ] ],
    \   'right': [ [ 'readonly', 'modified', 'ctags' ] ] },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'filepath' ],
    \             [ 'gitbranch' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileinfo' ] ] },
    \ 'inactive': {
    \   'left': [ [ 'filename' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ] },
    \ 'component_expand': { 'cwd': 'LightlineCWD' },
    \ 'component_type': { 'cwd': 'tabsel' },
    \ 'component_function': { 'ctags': 'gutentags#statusline',
    \                         'filepath': 'LightlineFilePath',
    \                         'fileinfo': 'LightlineFileInfo',
    \                         'gitbranch': 'LightlineGitBranch' } }
" }}}
