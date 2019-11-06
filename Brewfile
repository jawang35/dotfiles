tap 'homebrew/cask'
tap 'homebrew/cask-fonts'

brew 'bash'
brew 'bash-completion'
brew 'direnv'
brew 'docker-compose'
brew 'fd'
brew 'git'
brew 'git-lfs'
brew 'htop'
brew 'jq'
brew 'neovim'
brew 'python'
brew 'ripgrep'
brew 'tmux'
brew 'tree'

cask 'docker'
cask 'font-source-code-pro'
cask 'google-chrome'
cask 'hammerspoon'
cask 'karabiner-elements'
cask 'scroll-reverser'
cask 'slack'

if (File.file?('Brewfile.local'))
  instance_eval(File.read('Brewfile.local'))
end
