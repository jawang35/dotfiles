# Vim

Configurations and packages for [Vim](http://www.vim.org/).

## Usage

```
ln -s /path/to/dotfiles/vim ~/.vim
```

## Packages

Packages are managed using [pathogen](https://github.com/tpope/vim-pathogen). Each package is a Git submodule in `/path/to/dotfiles/vim/bundle`.

### Update Packages

```
git submodule update --init --recursive
```

### Airline/Powerline Fonts

[Airline](https://github.com/vim-airline/vim-airline) status bar uses [Powerline Fonts](https://github.com/powerline/fonts). The fonts are included as a Git submodule in `path/to/dotfiles/vim/fonts`. In `/path/to/dotfiles/vim/fonts`, run `install.sh` to install the Powerline Fonts. Terminal must be using a Powerline Font in order for the status bar to display properly.

