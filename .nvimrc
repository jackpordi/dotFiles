set shell=/bin/bash


if !has('nvim')
  set ttymouse=xterm2
endif

" This is the main vim configuration file.
" It is executed as a series of commands when vim starts up

" Enables Syntax highlighting
syntax on

" Filetype plugin on
filetype plugin indent on

" Map the leader key to backslash
let mapleader="\\"
set showcmd

"Enables Mouse Usage
set mouse=a

" Enables line numbers (relative)
set relativenumber
set number

if !&scrolloff
  set scrolloff=4       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Expands tabs to spaces with the tab key
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
"set smartindent


" Remember Cursor position between Vim sessions
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

" Sets vim to use OS clipboard
set clipboard+=unnamedplus

" Prevents formatting bullshit when pasting
set nopaste

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Enables alt-mappings to function properly
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor

" Highlights Current Line
set cursorline

" Enables lines and blocks swapping with alt-j, altk
nnoremap <M-J> :m .+1<CR>==
nnoremap <M-K> :m .-2<CR>==
inoremap <M-J> <Esc>:m .+1<CR>==gi
inoremap <M-K> <Esc>:m .-2<CR>==gi
vnoremap <M-J> :m '>+1<CR>gv=gv
vnoremap <M-K> :m '<-2<CR>gv=gv

" Go to end of line
inoremap <C-e> <C-o>$
" Same as above, for Macs
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Reduces delay for escape as alt has the same sequence as escape
" set timeoutlen=150 ttimeoutlen=0

" Faster line movement with  uppercase J and K
map <S-j> 10j
map <S-k> 10k

" Prevent pasting/replacing a visual selection to yank that
xnoremap p pgvy

" Through Paragraphs with { down and } up as opposed to default (reversed)
nnoremap { }
nnoremap } {

" Use Esc as Esc in :terminal mode
tnoremap <Esc> <C-\><C-n>

" Navigate visually with wrapped line
" noremap  <buffer> <silent> k gk
" noremap  <buffer> <silent> j gj
" noremap  <buffer> <silent> 0 g0
" noremap  <buffer> <silent> $ g$

" Going to a mark with ' by default goes to same column too
nnoremap ' `

" Move across wrapped lines like regular lines
noremap 0 ^
noremap ^ 0

" Toggle folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Sets wrap to be consistent with indentation
set breakindent

" Sets no persistent search highlight
set nohlsearch

" Editing a protected file as 'sudo'
cmap w!! %!sudo tee > /dev/null %


" Auto refresh when file changes (e.g. due to Git pull)
set autoread
" Trigger when cursor stops moving
au CursorHold, CursorHoldI * checktime
au FocusGained, BufEnter * :checktime

" Colors and making it pretty
set t_Co=256
color slate_arctic
highlight ColorColumn ctermbg=0
set colorcolumn=80
hi CursorLineNr   cterm=bold ctermfg=51

au BufRead *.asm :set ft=nasm

"set background=dark
"highlight Normal ctermbg=Black

"---------- Hardcore nav mode, not reccomended for newbs

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" Disable hjkl navigation to force learning other motions
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

"----------PLUGINS----------------------------------

runtime macros/matchit.vim

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'khzaw/vim-conceal'
Plug 'itchyny/vim-haskell-indent'
Plug 'neovimhaskell/haskell-vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-pydocstring'
Plug 'tell-k/vim-autopep8'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'yuttie/comfortable-motion.vim'
Plug 't9md/vim-choosewin'
"      Deoplete and language libraries
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/vimshell.vim'
Plug 'zchee/deoplete-jedi'
Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ponko2/deoplete-fish'


call plug#end()

"--------------------Airline Status Bar-------------
set laststatus=2
set noshowmode

let g:airline_theme='monochrome'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>

" Move to the next buffer
nnoremap <silent> } :bnext<CR>

" Move to the previous buffer
nnoremap <silent> { :bprevious<CR>

" ----------------ALE Linting---------------
 nmap <silent> <C-k> <Plug>(ale_previous_wrap)
 nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
      \   'javascript': [
      \       'eslint',
      \       'prettier',
      \       'standard'
      \   ],
      \   'python': [
      \       'autopep8'
      \   ],
      \   '*' : [
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ]
      \}

let g:ale_fix_on_save = 1

let g:ale_javascript_eslint_use_global = 1
"-------------------GitGutter-----------------------
noremap <M-g> :GitGutterToggle <cr>
let g:gitgutter_enabled = 0

"----------------JSON Highlighting----------------
let g:vim_json_syntax_conceal = 0
"----------------Autocomplete Engine--------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#sources#jedi#server_timeout = 300
let g:deoplete#sources#jedi#enable_cache = 1

call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('jedi',          'mark', '')
call deoplete#custom#source('vim',           'mark', '')
call deoplete#custom#source('neosnippet',    'mark', '')
call deoplete#custom#source('tag',           'mark', '')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', '')
call deoplete#custom#source('tmux-complete', 'mark', '')
call deoplete#custom#source('syntax',        'mark', '')
call deoplete#custom#source('member',        'mark', '.')

call deoplete#custom#source('jedi', 'matchers', ['matcher_full_fuzzy'])

" Use auto delimiter feature
call deoplete#custom#source('_', 'converters',
  \ ['converter_auto_delimiter', 'remove_overlap'])

let g:deoplete#sources#jedi#short_types = 1
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <Tab> pumvisible() ? "\<down>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<up>" : "\<S-Tab>"
"----------------Indent Guides-------------
let g:indent_guides_enable_on_vim_startup = 1
"-----------------Tmux Integration-----------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
""nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"-----------------Delimitmate and Closetag working together-----"
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
"-----------------Jedi (Python)---------------------------------"
let g:jedi#documentation_command = "<C-d>"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2

"-----------------NERDTree---------------------------------------"
map <Leader>f :NERDTreeToggle<CR>

"----------------Tagbar------------------------------------------
"SAME WIDTH WHEN ZOOMED AS ZOOMED OUT
let g:tagbar_zoomwidth = 0
let g:tagbar_compact = 1
"ABSOLUTE LINE NUMBERS
let g:tagbar_show_linenumbers = 0
let g:tagbar_show_visibility = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 0
"AUTOMATICALLY SHOWS CURRENT TAG (EXPANDS BRANCH AS NEEDED)
let g:tagbar_autoshowtag = 1
nnoremap <silent><Leader>t :TagbarToggle<CR>
"-----------------ChooseWin---------------------------------------
let g:choosewin_overlay_enable = 1
nnoremap <silent><Leader>c <Plug>(choosewin)

"-------------------CtrlP-----------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_show_hidden = 1
nnoremap <silent><Leader>p :CtrlPTag<CR>

"-----------------PyDoCString-------------------
nmap <silent> <C-i> <Plug>(pydocstring)
