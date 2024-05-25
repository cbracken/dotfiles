set nocompatible
set encoding=utf-8

call plug#begin()
" Colour scheme.
Plug 'craftzdog/solarized-osaka.nvim'

" Formatting.
Plug 'rhysd/vim-clang-format'   " clang-format.

" Language support plugins.
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
Plug 'rust-lang/rust.vim'

" Behaviour.
Plug 'ibhagwan/fzf-lua'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Bind fancier manpage plugin to Shift-k.
runtime ftplugin/man.vim
set keywordprg=:Man

" Disable visual-mode mouse select.
set mouse=

" Set <leader> to comma for convenience.
let mapleader=','

" Enable middle-mouse paste.
map!     <S-Insert> <MiddleMouse>
map      <S-Insert> <MiddleMouse>

" Kill ex mode.
noremap  Q          <NOP>

" Kill arrow keys, for great justice.
noremap  <Up>       <NOP>
noremap  <Down>     <NOP>
noremap  <Left>     <NOP>
noremap  <Right>    <NOP>

" Retain selection on <,>.
vnoremap     < <gv
vnoremap     > >gv

" Snippets.
nnoremap <leader>sch :0r   ~/.config/nvim/snippets/cc.h<CR>
nnoremap <leader>sci :0r   ~/.config/nvim/snippets/cc.cc<CR>
nnoremap <leader>scn :.-1r ~/.config/nvim/snippets/namespace.cc<CR>
nnoremap <leader>scs :.-1r ~/.config/nvim/snippets/struct.cc<CR>
nnoremap <leader>scc :.-1r ~/.config/nvim/snippets/class.cc<CR>
nnoremap <leader>sjn :.-1r ~/.config/nvim/snippets/journal.md<CR>

" Basic options.
set incsearch                " Turn on incrememental searching.
set hlsearch                 " Highlight search.
set visualbell               " Less noise.
set number                   " Use line numbering.
set ruler                    " Show row/col in status.
set laststatus=2             " Always show status line.
set showmatch                " Highlight matching bracket.
set history=50               " Keep 50 lines of cmdline history.
set wildmenu                 " Nicer autocomplete.
set wildmode=longest,full
set wildignore=*.o,*.pyc     " Ignore some filetypes during completion.
set spelllang=en_ca          " Set the spelling language.

" Omnicomplete.
set completeopt+=longest

" Indentation/tabulation.
set autoindent      " Copy indent from current line when starting a new line.
set smartindent     " Attempt to autoindent when starting a new line.
set smarttab        " Use shiftwidth rather than tabstop at start of line.
set tabstop=2       " Number of spaces per tab.
set shiftwidth=2    " Number of spaces for each step of autoindent.
set softtabstop=2   " Number of spaces per tab when editing.
set expandtab       " Insert spaces in place of tabs.

" Fix python's indent overrides.
au FileType python setl ts=2 sw=2 sts=2 et

" Configure tag file locations.
set tags+=~/.local/tags/system.tags
set tags+=~/.local/tags/cxx.tags

" Configure fzf-lua.
nnoremap <leader>^ <cmd>FzfLua buffers<CR>
nnoremap <leader>p <cmd>FzfLua files<CR>
nnoremap <leader>g <cmd>FzfLua grep<CR>
nnoremap <leader>l <cmd>FzfLua live_grep<CR>
nnoremap <leader>k <cmd>FzfLua builtin commands<CR>

" Configure colour scheme and syntax highlighting.
if &t_Co > 2
  syntax enable
  set background=dark
  colorscheme solarized-osaka

  " Highlight cursor line, max column.
  set cursorline

  " Cursor line highlighting.
  au WinLeave * setlocal nocursorline
  au WinEnter * setlocal cursorline
  au BufLeave * setlocal nocursorline
  au BufEnter * setlocal cursorline

  " Highlight over-length lines.
  au BufEnter,InsertLeave * set colorcolumn=80
  au BufEnter,InsertLeave *.txt,*.md set colorcolumn=80
  au BufEnter,InsertLeave *.txt,*.md set textwidth=80
  au BufEnter,InsertLeave *.java,*.m,*.mm set colorcolumn=100
  au BufEnter,InsertLeave *.java,*.m,*.mm set textwidth=100
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions

" Toggle absolute/relative numbering.
function! ToggleNumbering()
  if (&number == 0)
    set number
  elseif (&relativenumber == 0)
    set relativenumber
  else
    set norelativenumber
    set nonumber
  endif
endfunc
nnoremap <leader>n :call ToggleNumbering()<CR>
