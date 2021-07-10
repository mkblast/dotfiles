" Some Basic Options
set clipboard=unnamedplus
set mouse=nv
set noshowmode
set noto
set nowrap
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
set ignorecase
set formatoptions-=cro 
set updatetime=50
set splitbelow splitright
set cursorline
set cursorcolumn

let mapleader = " "

" Let List Some Plugins Here
call plug#begin('~/.config/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'                                 
Plug 'tpope/vim-surround'
Plug 'ptzz/lf.vim'                                            
Plug 'voldikss/vim-floaterm'                                 
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
call plug#end()

" colorscheme codedark
colorscheme codedark
let g:airline_theme='codedark'
hi Normal guibg=NONE ctermbg=NONE

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


"Some Maps

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
nmap <leader>f :Lf<CR>
let g:lf_width = 120
let g:lf_height = 35
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
let g:lf_map_keys = 0
