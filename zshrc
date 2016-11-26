###############################################################################
# ZSH configuration
###############################################################################

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# ZSH Theme
# ZSH_THEME="zhann"
ZSH_THEME="norm"

# Red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Save lots of history
SAVEHIST=1000

# Save it to a file
HISTFILE=~/.history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

###############################################################################
# User configuration
###############################################################################

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,exports,extra,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load the local dotfiles (specific to the OS)
for file in ~/.{path,exports_local,aliases_local,functions_local}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
