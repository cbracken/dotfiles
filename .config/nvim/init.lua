-- Plugin management with vim-plug.
vim.cmd [[
call plug#begin()
" Colour scheme.
Plug 'craftzdog/solarized-osaka.nvim'

" Formatting.
Plug 'rhysd/vim-clang-format'   " clang-format.

" Language support plugins.
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }
Plug 'nathangrigg/vim-beancount'
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'

" Behaviour.
Plug 'ibhagwan/fzf-lua'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()
]]

require('core.options')
require('core.keymappings')
require('plugins')
