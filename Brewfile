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
brew 'neofetch'
brew 'neovim'
brew 'python'
brew 'ripgrep'
brew 'tealdeer'
brew 'tmux'
brew 'tree'

# Mac OS only
if RUBY_PLATFORM.include? 'darwin'
    brew 'reattach-to-user-namespace'
end

cask 'docker'
cask 'font-source-code-pro'
cask 'google-chrome'
cask 'hammerspoon'
cask 'karabiner-elements'
cask 'kitty'
cask 'scroll-reverser'
cask 'slack'

if File.file?('Brewfile.local')
  instance_eval(File.read('Brewfile.local'))
end
