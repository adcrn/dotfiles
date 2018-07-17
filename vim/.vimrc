set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

set rtp+=/usr/local/opt/fzf

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

" Rainbow Parantheses
Plugin 'junegunn/rainbow_parentheses.vim'

" LimeLight
Plugin 'junegunn/limelight.vim'

" fzf
Plugin 'junegunn/fzf'

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
set cursorline           " highlight current line
set expandtab            " uses spaces for tabs
set hidden               " hide buffers instead of closing
set history=1000         " remember more commands and search history
set laststatus=2
set noerrorbells         " don't beep
set noshowmode           " lightline already handles statusbar
set relativenumber       " show how far away a line is
set showmatch            " show matching parentheses
set splitbelow           " new vertical split will show new window on bottom
set splitright           " new horizontal split will show new window on right
set tabstop=4            " tabs are four soaces
set textwidth=79         " wrap lines after 80 chars
set title                " change the terminal's title
set ttyfast              " fix slow scrolling
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu             " expand suggestions along bottom
set visualbell           " please don't beep
set wrap                 " wrap lines

" Themeing stuff
colo gruvbox
set background=dark

function! s:goyo_enter()
    colorscheme pencil
    set background=dark
    :Limelight
endfunction

function! s:goyo_leave()
    :Limelight!
    colorscheme gruvbox
endfunction

" Mapping
map <C-n> :NERDTreeToggle<CR>
nnoremap ; :
inoremap jj <ESC>

" Enable/disable Goyo on command
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Rainbow Parentheses
augroup rainbow
  autocmd!
  autocmd FileType python,rust,go,java RainbowParentheses
augroup END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
