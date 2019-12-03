tap 'homebrew/cask'
tap 'homebrew/cask-fonts'

brew 'bash'
brew 'bash-completion@2'
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

BREWFILE_LOCAL = File.join(ENV['HOME'], 'Brewfile.local')
if File.file?(BREWFILE_LOCAL)
  instance_eval(File.read(BREWFILE_LOCAL))
end
