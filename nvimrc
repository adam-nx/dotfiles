
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'psf/black', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-jedi'
Plug 'powerman/vim-plugin-AnsiEsc'
call plug#end()

let mapleader = ","

set autoindent
set clipboard=unnamed
set expandtab
set ignorecase
set listchars=tab:›\ ,eol:¬,trail:⋅
set number
set nowrap
set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=4
set wildmode=longest,list

set switchbuf=usetab,newtab

let g:python3_host_prog = '/Users/adamn/.local/share/virtualenvs/nvim3/bin/python'
"#let g:python_host_prog = '/Users/adamn/.pyenv/versions/py2nvim/bin/python'
set notermguicolors

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:jedi#completions_enabled = 1
let g:jedi#use_splits_not_buffers = "right"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! s:StripTrailingWhitespaces() abort
    let l:save = winsaveview()
    " vint: next-line -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
    keeppatterns %s/\v\s+$//e
    call winrestview(l:save)
endfunction
nnoremap <silent> <leader><Space> :call <SID>StripTrailingWhitespaces()<CR>

let g:airline_theme='night_owl'


"Leader shortcuts!

:map <leader>h :noh<CR>
:map <leader>p :!python3 %<CR>
:map <leader>w :Black<CR>:w<CR>
:map <leader>r :source ~/.nvimrc<CR>
:map <leader>t :NERDTreeToggle<CR>

abbreviate bashsh #!/bin/bash<CR>set -euo pipefail<CR>IFS=$'\n\t'
abbreviate pysh #!/usr/bin/env python3<CR><CR><CR>def main():<CR>pass<CR><CR>if __name__ == '__main__':<CR>main()
