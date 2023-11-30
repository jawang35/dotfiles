<a href="https://github.com/jawang35/dotfiles" title="Jason's dotfiles">
    <img src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/main/dotfiles-logo.svg?sanitize=true" alt="Jason's dotfiles" width="400">
</a>

[![License](https://img.shields.io/github/license/jawang35/dotfiles?color=informational)](https://github.com/jawang35/dotfiles/blob/master/LICENSE)
[![GitHub Workflow](https://img.shields.io/github/actions/workflow/status/jawang35/dotfiles/ci.yml?branch=master)](https://github.com/jawang35/dotfiles/actions/workflows/ci.yml)

This is my collection of [dotfiles](https://dotfiles.github.io/). As with any open source software never blindly running anything that has not been properly understood and/or vetted. These settings should be considered unstable as I'm constantly tinkering with them. Rather than installing, I recommend forking and modifying it for your own use or using as a resource for your own configurations.

## Installation

### Requires

- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) - optional

### Bootstrap

```sh
curl -s https://raw.githubusercontent.com/jawang35/dotfiles/master/bootstrap.sh | bash
```

[bootstrap.sh](bootstrap.sh) script will:
1. Clone the repository as a Git bare repository into ~/.dotfiles.
2. Check out configuration files into the `$HOME` directory.
3. Install submodule dependencies.
4. Set macOS configurations.
5. Install [Homebrew](#homebrew) packages and applications.
6. Load [.bash_profile](.bash_profile).

## Configurations

Configuration files are managed using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles). `config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the repository.

To keep the `$HOME` directory clean, configurations are stored in [.config](.config) when possible. Local configurations and secrets are sourced from [.local](.local).

To update to latest:

```sh
config update all
```

## License

© 2016 Jason Wang licensed under the [MIT License](LICENSE).
