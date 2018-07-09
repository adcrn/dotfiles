set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Goyo, distraction-free writing
Plugin 'junegunn/goyo.vim'

" Lightline, statusbar customization
Plugin 'itchyny/lightline.vim'

" Easy commenting
Plugin 'tomtom/tcomment_vim'

" Goyo theme
Plugin 'reedes/vim-colors-pencil'

" Gruvbox theme
Plugin 'morhetz/gruvbox'

" Autoclose
Plugin 'townk/vim-autoclose'

" Nerdtree
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Status bar themeing
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set backspace=indent,eol,start "backspace over everything in insert
set expandtab            " uses spaces for tabs
set hidden               " hide buffers instead of closing
set history=1000         " remember more commands and search history
set laststatus=2
set noerrorbells         " don't beep
set noshowmode           " lightline already handles statusbar
set nowrap               " don't wrap lines
set number               " show line numbers
set showmatch            " show matching parentheses
set tabstop=4            " tabs are four soaces
set title                " change the terminal's title
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " please don't beep
colo gruvbox
set background=dark

function! s:goyo_enter()
    colorscheme pencil
    set background=dark
endfunction

function! s:goyo_leave()
    colorscheme gruvbox
endfunction

" Open nerdtree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
