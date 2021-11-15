set shell=/bin/bash

if !has('nvim')
  set ttymouse=xterm2
endif

" This is the main vim configuration file.
" It is executed as a series of commands when vim starts up

" Enables Syntax highlighting
syntax on

" No Swap files
set noswapfile

"Filetype plugin on
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

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Expands tabs to spaces with the tab key
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent

command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"

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
set termguicolors
highlight ColorColumn ctermbg=235
set colorcolumn=81
hi CursorLineNr   cterm=bold ctermfg=51
hi SignColumn ctermbg=0

au BufRead *.asm :set ft=nasm

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap <CR> <CR><C-g>u

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

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'karb94/neoscroll.nvim'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
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
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'dart-lang/dart-vim-plugin'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'heavenshell/vim-pydocstring'
Plug 'suy/vim-context-commentstring'
Plug 'tell-k/vim-autopep8'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'guns/xterm-color-table.vim'
Plug 'justinmk/vim-sneak'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/csv.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'AndrewRadev/tagalong.vim'

Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'

"      COC and language libraries
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'

call plug#end()

colorscheme dracula_bold
" Highlights Current Line
set cursorline
hi CursorLine term=underline cterm=underline gui=underline guibg=NONE

"--------------------Airline Status Bar-------------
set laststatus=2
set noshowmode


lua << EOF
  require('lualine').setup()
  require('neoscroll').setup({
    easing_function = "quadratic"
  })
EOF

" let g:airline_theme='monochrome'

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

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


" ===============================================================
"-------------------GitGutter-----------------------
" ===============================================================
noremap <M-g> :GitGutterToggle <cr>
let g:gitgutter_enabled = 0


" ===============================================================
"----------------Indent Guides-------------
" ===============================================================
let g:indent_guides_enable_on_vim_startup = 1

" ===============================================================
"-----------------Tmux Integration-----------
" ===============================================================
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-Down> :TmuxNavigateDown<CR>
nnoremap <silent> <C-Up> :TmuxNavigateUp<CR>
nnoremap <silent> <C-Right> :TmuxNavigateRight<CR>
""nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


" ===============================================================
"-----------------Delimitmate and Closetag working together-----"
" ===============================================================
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts,*.tsx"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"


" ===============================================================
"              AUTOCOMPLETE WITH COC
" ===============================================================

let g:coc_node_path = '/Users/jackpordi/.nvm/versions/node/v16.13.0/bin/node'

" Coc Extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-flutter',
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use Tab and Shift-Tab to navigate autocomplete choices
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"
" Enter to select
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Select first option if no selection
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gN <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

nnoremap <silent> L :call CocActionAsync('doHover')<cr>

" Diagnostics
nnoremap <silent> :Diag<cr> :<C-u>CocList diagnostics<cr>

" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Code Action
nmap <leader>do  <Plug>(coc-codeaction)
xmap <leader>do  <Plug>(coc-codeaction-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Fmt :call CocAction('format')

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Action menu
nmap <leader>do  <Plug>(coc-codeaction)

"" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use K to show documentation in preview window
nnoremap <silent> L :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Set Floating Window Background Color
highlight CocFloating ctermbg=black

" ===============================================================
"                  FZF
" ===============================================================

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let $FZF_DEFAULT_OPTS = '--bind tab:down,shift-tab:up'

" ===============================================================
" Ale Config
" ===============================================================
let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_fix_on_save = 0
let g:ale_set_baloons = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

let g:ale_set_highlights = 0 " Disable highligting

:call extend(g:ale_fixers, {'*': ['remove_trailing_lines', 'trim_whitespace']})

" ================================================================
"                           Fugitive
" ================================================================
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" ================================================================
"                  Tagalong tag replacement
" ================================================================
let g:tagalong_additional_filetypes = ['tsx']


" ================================================================
"                  Bufferline setup
" ================================================================
lua << EOF
require("bufferline").setup {
  show_buffer_icons = true,
  show_buffer_close_icons = true,
}
EOF
