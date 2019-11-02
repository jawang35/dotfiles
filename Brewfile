tap 'homebrew/cask'
tap 'homebrew/cask-fonts'

brew 'bash-completion'
brew 'direnv'
brew 'fd'
brew 'git'
brew 'htop'
brew 'jq'
brew 'neovim'
brew 'ripgrep'
brew 'tmux'
brew 'tree'

cask 'docker'
cask 'font-source-code-pro'
cask 'google-chrome'
cask 'hammerspoon'
cask 'karabiner-elements'
cask 'slack'

if (File.file?('Brewfile.local'))
  instance_eval(File.read('Brewfile.local'))
end