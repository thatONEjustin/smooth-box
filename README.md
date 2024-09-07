# Smooth dotfiles
This whole repo is because NixOS is better for server environments.

Using GNU Stow (outlined below). 

---

### Packages
These are some of my essentials anything removed is pretty much not needed or replaced.

- tmux
- neovim
- oh-my-zsh
- zsh
- zplug
- nvm
- rvm
- git
- rg
- fzf
- fd-find
--- 

### Symlinks 
This has been entirely replaced by GNU Stow. Its why there's a giant structure change to how the files are set because stow allows a single line solution in a package that can be installed on all required environments. 

```shell
$ brew install stow
$ git clone https://github.com/thatONEjustin/smooth-box.git
$ stow --target="$HOME" --dir="$HOME/github/smooth-box" .
```
