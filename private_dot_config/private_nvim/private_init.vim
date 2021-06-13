" Some Basic Options
 
set clipboard=unnamedplus
set mouse=nv
set noshowmode
set noto
" set nowrap
set termguicolors
set nohlsearch
set nu rnu
set hidden
set scrolloff=8
set signcolumn=yes
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set smartcase
set formatoptions-=cro 

let mapleader = " "

" Let List Some Plugins Here

call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'                               "Nord colorscheme
Plug 'jiangmiao/auto-pairs'                                 
Plug 'tpope/vim-surround'
Plug 'ptzz/lf.vim'                                            "Lf intergration
Plug 'voldikss/vim-floaterm'                                  "A floating terminal
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-commentary'
call plug#end()

" Nooooord
colorscheme nord
let g:airline_theme='nord'


" Airline

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

" Gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" Lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>ld <plug>(lsp-definition)
    nmap <buffer> <leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>lr <plug>(lsp-references)
    nmap <buffer> <leader>li <plug>(lsp-implementation)
    nmap <buffer> <leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <leader>lpd <plug>(lsp-peek-definition)
    nmap <buffer> <leader>ln <plug>(lsp-rename)
    nmap <buffer> <leader>l<S-TAB> <plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>l<TAB> <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"Some Maps
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Insert mode to Normal mode
inoremap <DEL> <ESC> 

" Windows
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>

" Buffers
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bj <c-^>
nnoremap <TAB> :bnext<CR>
nnoremap <S><TAB> :bprevious<CR>

" Windows
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wf :split<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :on<CR>
nnoremap <leader>wh :hide<CR>

" For git
nmap <leader>gs :G<CR>

" Lf Plugin Options
let g:lf_width = 120
let g:lf_height = 35
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
let g:lf_map_keys = 0
nmap <leader>f :Lf<CR>
