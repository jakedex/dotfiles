#!/usr/bin/env bash

# Automated installer for jakedex/dotfiles using dotbot (anishathalye/dotbot)

###############################################################################
# dotbot install
###############################################################################

echo "Linking with dotbot:"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG="install.conf.json"
DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

cd "${BASEDIR}"
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

###############################################################################
# Update Vim plugins
###############################################################################

echo "Cleaning/Installing/Updating Vim plugins:"

vim -E -s <<-EOF
    :source ~/.vimrc
    :PlugInstall
    :PlugClean
    :qa
EOF

###############################################################################
# Install zsh (oh-my-zsh) + plugins + themes
###############################################################################

echo "Installing zsh (oh-my-zsh) + plugins + themes:"

if [ ! -d $HOME/.oh-my-zsh ] ; then
    echo "Installing Oh My Zsh"
    curl -L http://install.ohmyz.sh | sh
    # Put my ~/.zshrc file back
    rm ~/.zshrc
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
else
    echo "Oh My Zsh already installed"
fi

###############################################################################
# Install brew + formulae (macOS only)
###############################################################################

## abort if not macOS
[[ "$OSTYPE" =~ ^darwin ]] || return 1

echo "Installing brew and formulae (z, fzf, thefuck, etc...):"

# brew installed?
which -s brew
if [[ $? != 0 ]] ; then
    # install Homebrew
    echo "Installing brew:"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Brew already installed. Let's make sure your formulae are up to date:"
    brew update
    brew upgrade
fi

# Double check we've installed brew correctly
if command -v brew >/dev/null 2>&1 ; then
  echo "Installing brew formulae:"

  # Install GNU core utilities (those that come with macOS are outdated)
  # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
  brew install coreutils

  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  brew install findutils

  # Install GNU `sed`, overwriting the built-in `sed`.
  brew install gnu-sed --with-default-names

  # Install `wget` with IRI support.
  brew install wget --with-iri

  # Install more recent versions of some macOS tools.
  brew install vim --override-system-vi
  brew install homebrew/dupes/grep --with-default-names
  brew install homebrew/dupes/openssh

  # You'll need to run through fzf's setup
  # Note: I've already added required configuration to ~/.extras
  brew install fzf
  # /usr/local/opt/fzf/install

  # Misc useful formulae (brew list -la | awk '{a="brew install "$9; print a}' | pbcopy)
  brew install ack
  brew install findutils
  brew install fpp
  brew install gifsicle
  brew install git
  brew install git-extras
  brew install highlight
  brew install htop-osx
  brew install httpie
  brew install imagemagick --with-webp
  brew install lynx
  brew install mongodb
  brew install mysql
  brew install nmap
  brew install nvm
  brew install openssl
  brew install python
  brew install python3
  brew install ruby
  brew install sqlite
  brew install the_silver_searcher
  brew install thefuck
  brew install tmux
  brew install tofrodos
  brew install tree
  brew install z

  brew cleanup

else
    echo "Error installing brew... brew + packages not installed."
fi

echo "Done!"
