if !has('nvim')
  set ttymouse=xterm2
endif

" This is the main vim configuration file.
" It is executed as a series of commands when vim starts up

" Enables Syntax highlighting
syntax on

" Filetype plugin on
filetype plugin indent on

"Enables Mouse Usage
set mouse=a

" Enables line numbers (relative)
set relativenumber

" Expands tabs to spaces with the tab key
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
"set smartindent


" Remember Cursor position
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

" Sets vim to use OS clipboard
set clipboard^=unnamed

" Prevents formatting bullshit when pasting
set nopaste

" Enables alt-mappings to function properly
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor


" Enables lines and blocks swapping with alt-j, altk
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
nnoremap <M-J> :m .+10<CR>==
nnoremap <M-K> :m .-11<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" Reduces delay for escape as alt has the same sequence as escape
set timeoutlen=10 ttimeoutlen=0

" Faster line movement with  uppercase J and K
map <S-j> 10j
map <S-k> 10k

" Through Paragraphs with { down and } up as opposed to default (reversed)
nnoremap { }
nnoremap } {

" Editing a protected file as 'sudo'
cmap w!! %!sudo tee > /dev/null %

set t_Co=256
color slate_arctic
highlight ColorColumn ctermbg=0
set colorcolumn=80
hi LineNr ctermfg=157
hi comment ctermfg=195
" It is possible to configure settings with this file.
" This line sets it so that 
" automatically
" when the buffer is read into (when a file is loaded)
" when the filename matches any asm file
" execute the command after the colon - this sets filetype to be nasm for highlighting
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

"----------PLUGINS----------------------------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"-------------------CtrlP-----------------------

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_show_hidden = 1


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
nnoremap <silent> ] :bnext<CR>

" Move to the previous buffer
nnoremap <silent> [ :bprevious<CR>

"-------------Syntastic------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" C config
let g:syntastic_c_include_dirs = [ '../include', 'include', '../../include', '../../../include', 'header', '../headers', '../../headers',  '../../../headers', '../utils/include', '../../utils/include']

" Java classpaths
let g:syntastic_java_checkers=['java']
let g:syntastic_java_javac_config_file_enabled = 1


"----------------Indent Guides-------------

let g:indent_guides_enable_on_vim_startup = 1

"-----------------Tmux Integration-----------
let g:tmux_navigator_no_mappings = 1
"
"nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
"nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
"nnoremap <silent> <M-Up>   :TmuxNavigateUp<cr>
"nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
""nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
