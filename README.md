# dotfiles
sooper sekrit terminal custom stuff

## vim
I do virtually all of my development in `vim`, which is actually not that bad after you learn about buffers, shortcuts, etc. I use [Vundle](https://github.com/VundleVim/Vundle.vim) to extend my vim setup with a number of plugins; they are as follows:
- [autoclose](https://github.com/townk/vim-autoclose) - auto-close punctuation that occurs in pairs
- [Goyo](https://github.com/junegunn/goyo.vim) - distraction-free writing, great for writing text posts like this one
- [Gruvbox](https://github.com/morhetz/gruvbox) - solarized-esque dark theme
- [lightline](https://github.com/itchyny/lightline.vim) - statusline plugin
- [Nerdtree](https://github.com/scrooloose/nerdtree) - file system tree explorer
- [rainbow_parentheses.vim](https://github.com/junegunn/rainbow_parentheses.vim) - color-code open and closing parentheses
- [tcomment_vim](https://github.com/tomtom/tcomment_vim) - lots of options, I just use it to make comments easier
- [vim-colors-pencil](https://github.com/reedes/vim-colors-pencil) - dark is the theme of choice for Goyo

## zsh
zsh is my preferred shell and I use [Antibody](https://github.com/getantibody/antibody) to manage my plguins. The plugins I currently use:
- [geometry](https://github.com/geometry-zsh/geometry) - minimal prompt with clear Git information
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Fish-like autosuggetions as you type
- [zsh-completions](https://github.com/zsh-users/zsh-completions) - additional completion definitions
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) - Fish-like history search
- [zsh-syntax-hightlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Fish-like syntax highlighting

## misc
My `.zshrc` contains aliases for a couple programs that I use to make computing a _little_ bit easier.
- [exa](https://the.exa.website/) - parallelized modern replacement for `ls`; does colors, git, tree view, wide view, etc.
- [pass](https://www.passwordstore.org/) - encrypted password store; allows for generation and copy-paste
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
