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
set softtabstop=2
set autoindent


" Remember Cursor position between Vim sessions
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

" Sets vim to use OS clipboard
set clipboard+=unnamedplus

" Prevents formatting bullshit when pasting
set nopaste

" Enables alt-mappings to function properly
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor

" Highlights Current Line
set cursorline

" Enables lines and blocks swapping with alt-J, alt-K
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
map <S-j> 8j
map <S-k> 8k

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
set colorcolumn=81
hi CursorLineNr   cterm=bold ctermfg=51

au BufRead *.asm :set ft=nasm

"set background=dark
"highlight Normal ctermbg=Black

"---------- Hardcore nav mode, not reccomended for newbs

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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
call plug#begin('~/.local/share/nvim/plugged')

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
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'yuttie/comfortable-motion.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/csv.vim'
Plug 'lifepillar/pgsql.vim'

"      COC and language libraries
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'guns/xterm-color-table.vim'

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

let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_fixers = {
      \   'javascript': [
      \       'eslint',
      \       'standard',
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   'python': [
      \       'add_blank_lines_for_python_control_statements',
      \       'autopep8',
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ],
      \   '*' : [
      \       'remove_trailing_lines',
      \       'trim_whitespace'
      \   ]
      \}

let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_use_global = 1
nnoremap <silent><M-a> :ALEToggle<CR>
let g:ale_echo_msg_format = '%linter%: %s'
"-------------------GitGutter-----------------------
noremap <M-g> :GitGutterToggle <cr>
let g:gitgutter_enabled = 0

"----------------JSON Highlighting----------------
let g:vim_json_syntax_conceal = 0
"----------------Autocomplete Engine--------------
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.jsx"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"
"-----------------Jedi (Python)---------------------------------"
let g:jedi#documentation_command = "<C-d>"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2

"-----------------NERDTree---------------------------------------"
map <M-t> :NERDTreeToggle<CR>


"-----------------AUTOCOMPLETE WITH COC--------------------------

"" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

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
"-------------------CtrlP-----------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_show_hidden = 1
nnoremap <silent><Leader>p :CtrlPTag<CR>

"-----------------PyDoCString-------------------
nmap <silent> <C-i> <Plug>(pydocstring)

""-----------------EasyTags
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

"-------------------Snippet expands
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
