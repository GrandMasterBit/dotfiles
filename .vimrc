set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Languages
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'


Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'preservim/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    
endfunction

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '?'}


" asyncomplete.vim

let g:asyncomplete_auto_completeopt = 1

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
if (has("termguicolors"))
"	set termguicolors
endif

"colorscheme tender
syntax on
set number
set scl=number

if &term == "alacritty"        
  let &term = "xterm-256color"
endif

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" map
map <C-n> :NERDTreeToggle<CR>
