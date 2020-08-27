set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

set rtp+=/usr/local/opt/fzf

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Lightline, statusbar customization
Plug 'itchyny/lightline.vim'

" Easy commenting
Plug 'tomtom/tcomment_vim'

" themes
Plug 'morhetz/gruvbox'

" Autoclose
Plug 'townk/vim-autoclose'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Rainbow Parantheses
Plug 'junegunn/rainbow_parentheses.vim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Polyglot
Plug 'sheerun/vim-polyglot'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" markdown-toc
Plug 'mzlogin/vim-markdown-toc'

Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

call plug#end()            " required
filetype plugin indent on    " required

let mapleader = ","

function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': function('s:copy_results'),
  \ }

" Status bar themeing
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"

" Settings for Vimwiki
let g:vimwiki_list = [{'path':'~/cabinet/','ext':'.wiki', 'diary_rel_path':'journal/', 'diary_index':'journal', 'syntax':'markdown'}]

set backspace=indent,eol,start "backspace over everything in insert
set cursorline           " highlight current line
set expandtab            " uses spaces for tabs
set hidden               " hide buffers instead of closing
set history=1000         " remember more commands and search history
set laststatus=2
set nobackup
set noerrorbells         " don't beep
set noshowmode           " lightline already handles statusbar
set nowritebackup
set shortmess+=c         " coc.nvim setting / Don't pass messages to ins-completion-menu
set showmatch            " show matching parentheses
set splitbelow           " new vertical split will show new window on bottom
set splitright           " new horizontal split will show new window on right
set tabstop=4            " tabs are four soaces
set textwidth=79         " wrap lines after 80 chars
set title                " change the terminal's title
set ttyfast              " fix slow scrolling
set undolevels=1000      " use many muchos levels of undo
set updatetime=300       " coc.nvim
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu             " expand suggestions along bottom
set visualbell           " please don't beep
set wrap                 " wrap lines

" Themeing stuff
set termguicolors
colo gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Mapping
map <C-n> :NERDTreeToggle<CR>
nnoremap ; :
inoremap jj <ESC>

" Rainbow Parentheses
augroup rainbow
  autocmd!
  autocmd FileType python,rust,go,java RainbowParentheses
augroup END

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rustfmt_autosave = 1

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

command! Journal VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
