# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load the local dotfiles (specific to the OS)
for file in ~/.{path,exports_local,aliases_local,functions_local,bash_profile_local}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# OSX-only stuff below. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1
 
# z beats cd most of the time.
#   github.com/rupa/z
source `brew --prefix`/etc/profile.d/z.sh

# Print sys stats
archey
