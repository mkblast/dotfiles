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
set t_Co=256
set t_ut=

let mapleader = " "

" Let List Some Plugins Here
call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
call plug#end()

" Colorscheme
let g:gruvbox_sign_column = 'bg0'
colorscheme gruvbox
let g:airline_theme='gruvbox'
hi Normal guibg=NONE ctermbg=NONE

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
" function! MyLineNumber()
"   return substitute(line('.'),'\d\@<=\(\(\d\{3\}\)\+\)$',',&','g').'/'.
"     \    substitute(line('$'),'\d\@<=\(\(\d\{3\}\)\+\)$',',&','g')
" endfunction

" call airline#parts#define('linenr', {'function':'MyLineNumber','accents':'bold'})
" let g:airline_section_z = airline#section#create(['%3p%%:','linenr',':%3v'])

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
let g:lf_replace_netrw = 1
let g:lf_map_keys = 0

" Coc config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
