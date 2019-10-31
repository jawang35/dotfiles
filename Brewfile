tap 'homebrew/cask'

brew 'direnv'
brew 'fd'
brew 'git'
brew 'htop'
brew 'neovim'
brew 'ripgrep'
brew 'tmux'
brew 'tree'

cask 'docker'
cask 'google-chrome'
cask 'hammerspoon'
cask 'karabiner-elements'

if (File.file?('Brewfile.local'))
  instance_eval(File.read('Brewfile.local'))
end
