#!/usr/bin/env bash

# Automated installer for jakedex/dotfiles using dotbot (anishathalye/dotbot)

# Stop installer execution on erorr
set -e

echo "Linking with dotbot:"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG="install.conf.json"
DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

cd "${BASEDIR}"
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

# Update Vim plugins (https://github.com/captbaritone/dotfiles/blob/master/vim/install.sh)
echo "Cleaning/Installing/Updating Vim plugins:"

vim -E -s <<-EOF
    :source ~/.vimrc
    :PlugInstall
    :PlugClean
    :qa
EOF

echo "Done!"
