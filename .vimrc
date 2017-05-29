" enable Pathogen plugin manager
execute pathogen#infect()

" Disables vi compatibility mode for more options
set nocompatible

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
set number

" Expands tabs to spaces with the tab key
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Sets vim to use OS clipboard
set clipboard^=unnamed

" Enables lines and blocks swapping with alt-j, altk
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Faster line movement with  uppercase J and K
map <S-j> 10j
map <S-k> 10k

set colorcolumn=80
" It is possible to configure settings with this file.
" This line sets it so that 
" automatically
" when the buffer is read into (when a file is loaded)
" when the filename matches any asm file
" execute the command after the colon - this sets filetype to be nasm for highlighting
au BufRead *.asm :set ft=nasm
set autoindent

colorscheme solarized
set background=dark
"highlight Normal ctermbg=Black
set t_Co=256

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
" 
"--------------------- AIRLINE ----------------
"Enable Vim Airline
set laststatus=2

" Powerline fonts
let g:airline_powerline_fonts = 1" Enable the list of buffers

" Add Airline tabs/list buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>

" Move to the next buffer
nnoremap <C-Right> :bnext<CR>

" Move to the previous buffer
nnoremap <C-Left> :bprevious<CR>


"--------------- NERDTREE CONFIG -------------------------
" Toggle NERDTree
nmap <leader>NT :NERDTreeToggle <CR>
map <silent> <C-n> :NERDTreeToggle <CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>X :bp <BAR> bd #<CR>


" show hidden files
let NERDTreeShowHidden=1

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"----------------- Syntastic--------------------"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Java classpaths
" let g:syntastic_java_checkers=['java']
let g:syntastic_java_javac_config_file_enabled = 1

"------------ DelimitMate bracket closer

let delimitMate_expand_cr = 1

""---------------------CtrlP----------------
set runtimepath^=~/.vim/bundle/ctrlp.vim

"----------------Tag bar---------------
nmap <C-t> :TagbarToggle<CR>

