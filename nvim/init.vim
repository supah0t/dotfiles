"Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'numToStr/FTerm.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Initialize plugin system
call plug#end()

" My remaps -- work in progress
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nnoremap K {
vnoremap K {
nnoremap J }
vnoremap J }
nnoremap <silent> <CR> :noh<CR>
nnoremap L $
nnoremap H ^
let mapleader=","
nnoremap <silent> <leader>l :join<CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>wq :wq <CR>
nnoremap <leader>z <C-W>r <CR> 
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>q :Ex<CR>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" keybind to copy and paste between system and vim or different vim instances
vnoremap <leader>c "+y<CR>
" Navigating splits
map <leader>v "+P
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" Navigating tabs
nnoremap <leader>t :tabnew
nnoremap <leader>T :tabclose<CR>
nnoremap <S-TAB> gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
" Floating terminal command
map <leader>' :lua require('FTerm').open()<CR>

"Enable autocompletion
set wildmode=longest,list,full

"Disables automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"nerdtree ignores node_modules
let g:NERDTreeIgnore = ['^node_modules$']

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"Relative line number
set number relativenumber
set nu rnu

set smarttab
set autoindent
set smartindent
set cindent

let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1

" always show signcolumns
set signcolumn=yes

" Status line
set laststatus=2
set showcmd

" Escaping from insert mode delay
set timeoutlen=1000
set ttimeoutlen=5

" Cursor stuff
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Colour stuff
set background=dark
set t_Co=256
set termguicolors
colorscheme gruvbox
let g:gruvbox_guisp_fallback = 'bg'
" Reds stuff that is after column 80
highlight OverLength guibg=#592929
match OverLength /\%>80v.\+/
" Comments
highlight Comment guifg=grey
highlight Comment gui=none 
" Transparency on / off
hi Normal guibg=NONE ctermbg=NONE
" Mouse
set mouse=a

" CtrlP initial values
let g:ctrlp_map  ='<c-p>'
" Initial value of MRU
"let g:ctrlp_cmd  ='CtrlPMRU'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1

set encoding=utf-8
let g:airline_left_sep=''
let g:airline_right_sep=''

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
  inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:airline#extensions#coc#enabled = 1

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" coc preferences, accessible by :CocConfig
" listed here for completeness
"{
	""coc.preferences.formatOnSaveFiletypes": [
		""javascript",
		""jsx",
		""typescript",
		""tsx",
		""json"
	"],
	""diagnostic.messageTarget": "echo"
"}

" work in progress
" toggle line number on off, needs some tweaking to not cycle through [no numbers]
"nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
"map <silent> <F11> :set invnumber<cr>


" Closetag Configs
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*js,*jsx,*ts,*tsx'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*js,*ts,*tsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,ts,tsx'

set tabstop=4
set shiftwidth=4
set expandtab
