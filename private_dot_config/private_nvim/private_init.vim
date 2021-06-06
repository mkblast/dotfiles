"Some Basic Options

set clipboard=unnamedplus
set mouse=nv
set noshowmode
set noto
"set nowrap
set termguicolors
set nohlsearch
set nu rnu
set scrolloff=8
set signcolumn=yes
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set smartcase

let mapleader = " "

"Let List Some Plugins Here

call plug#begin('~/.config/nvim/plugged')
Plug 'arcticicestudio/nord-vim'                "Nord colorscheme
Plug 'prabirshrestha/vim-lsp'                  "Lsp will be replaced after Nvim0.5.0
Plug 'mattn/vim-lsp-settings'                  "Settings for Lsp
Plug 'prabirshrestha/asyncomplete.vim'         "Auto-complition
Plug 'prabirshrestha/asyncomplete-lsp.vim'     "Auto-complition for LSP
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ptzz/lf.vim'                             "Lf intergration
Plug 'voldikss/vim-floaterm'                   "A floating terminal
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"Nooooord
colorscheme nord

"Lf Plugin Options
let g:lf_width = 120
let g:lf_height = 35
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory

"Airline
let g:airline_theme='nord'
"Fix Airline
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

"Some Maps

"Windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Tabs 
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>c :tabclose<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>N :tabprevious<CR>

"Auto complition
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"For git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
