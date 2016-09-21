# Dotfiles
The more I tinker around with Unix/bash/Linux, the more unorganized my dotfiles become - so, I decided to finally to do this right. These dotfiles are compatable with both Arch Linux and OS X.

_Note that these dotfiles still need work to complete an automatic installation._

![My terminal setup](http://www.jakedex.com/img/dotfiles2.png)
## Installation
Thanks to [dotbot](https://github.com/anishathalye/dotbot), installing my dotfiles is relitively easy.

__Warning__: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails.

You can clone the repository wherever you want (I keep mine in `~/.dotfiles`). The `install` script will run [dotbot](https://github.com/anishathalye/dotbot) to install the symlinks in your home folder.
```
git clone https://github.com/jakedex/dotfiles.git .dotfiles && cd .dotfiles && ./install
```

#### Sensible OS X Defaults
When setting up a new mac, the `.osx` script will set some sensible OS X defaults. These are my handpicked preferences from [Mathias Bynens' .osx script](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).
The script also installs all of my default applications with [Homebrew Cask](http://caskroom.io/).

#### Getting Vim Up and Running
You'll need to make sure [Vundle](https://github.com/VundleVim/Vundle.vim) is installed in order to install my Vim plugins/use my `.vimrc` properly. Use the following command to install Vundle.

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

You can then install my Vim plugins by opening vim and running `:PluginInstall`. 


## Configuration
The configuration for dotbot is in `install.conf.yaml`. See [dotbot's documentation](https://github.com/anishathalye/dotbot#configuration) for more details on how to link files/directories and run shell commands during the configuration process.

## Inspiration
* [Mathias Bynens'](https://mathiasbynens.be/) ever popluar [dotfiles repository and .osx script](https://github.com/mathiasbynens/dotfiles)
* [Ben Altman's](http://benalman.com/) [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Anish Athalye's](http://www.anishathalye.com/) wonderful [dotbot](https://github.com/anishathalye/dotbot) and [dotfiles guide](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

## License
Copyright (c) 2016 Jacob Dexheimer. Released under the MIT License. See [LICENSE.md](https://github.com/jakedex/dotfiles/blob/master/LICENSE) for details.
