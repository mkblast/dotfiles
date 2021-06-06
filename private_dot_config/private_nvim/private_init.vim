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
Plug 'arcticicestudio/nord-vim'                               "Nord colorscheme
Plug 'prabirshrestha/vim-lsp'                                 "Lsp will be replaced after Nvim0.5.0
Plug 'mattn/vim-lsp-settings'                                 "Settings for Lsp
Plug 'jiangmiao/auto-pairs'                                 
Plug 'tpope/vim-surround'
Plug 'ptzz/lf.vim'                                            "Lf intergration
Plug 'voldikss/vim-floaterm'                                  "A floating terminal
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

call plug#end()
"Nooooord
colorscheme nord
let g:airline_theme='nord'

"Lf Plugin Options
let g:lf_width = 120
let g:lf_height = 35
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory

"Airline
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

"Gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

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

"Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

"For git
nmap <leader>gs :G<CR>

"LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

"Snippits
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
