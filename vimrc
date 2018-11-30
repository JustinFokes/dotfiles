""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My .vimrc -- if you can even call it 'mine'...
" Instructions:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#infect()
call pathogen#helptags()
let $PATH=substitute(system("echo \$PATH"), "\r\*\n", "", "g")
set clipboard=unnamed
set nobackup
set synmaxcol=328
syntax sync minlines=500
set cursorline!
set lazyredraw
set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=1  
set shiftwidth=1
set softtabstop=1
set cursorline
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cmdheight=2
set switchbuf=useopen
set number
set numberwidth=1
set showtabline=1
set winwidth=120
set shell=bash
set t_ti= t_te=
set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set showcmd
syntax enable
syntax on
filetype plugin indent on
filetype plugin on
set wildmode=longest
set wildmenu
set cuc
"au BufNewFile,BufRead *.json set ft=javascript
let macvim_hig_shift_movement = 1
let g:ctrlp_max_files=0
let g:indent_guides_enable_on_vim_startup=0
set linespace=1
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAP-LEADER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>t :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let NERDTreeQuitOnOpen=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap <Esc> to fd !--love it--!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap fd <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color scheme! You can find me in colors! 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme onedark
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set save as space w and quit as space q 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Space>w :w<CR>
map <Space>q :q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimrc from anywhere!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove crosshairs, in order to bring airline back online! 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocursorline
set nocursorcolumn
set t_Co=256
highlight Comment ctermfg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" POWERLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STARTIFY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_bookmarks = ['~/Desktop']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"Ack! will not search __tests__!
let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir=__tests__'

"map leader a to ack the current word under cursor in the stated directory
nnoremap <Leader>ap :Ack!<Space> "<cword>" ../../../..<CR>

nnoremap \ :Ack!<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI FONT *MacVim specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" prompt all fonts when sourcing...

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS BEAUTIFY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

autocmd FileType vue noremap <buffer> <c-f> :%!vue-formatter<CR>
autocmd BufEnter,BufRead *.vue set filetype=vue.javascript
autocmd QuickFixCmdPost *grep* cwindow
let g:deoplete#enable_at_startup = 1

set guifont=SourceCodeProForPowerline-Regular:h13

set tags=./tags,tags;$HOME

nnoremap <Leader>g :Ggrep! exports."<cword>"<CR> 
autocmd QuickFixCmdPost *grep* cwindow
let NERDTreeShowHidden=1
