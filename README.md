# Smooth dotfiles
This whole repo is because NixOS is better for server environments.

just a few symlinks will keep everything in the repo and get a machine up and running fairly quickly. 

all of my dotfiles mimic the directories they're based out of, which is kind of extra but reinforces where the file should be in case you just want to copy things over instead of linking.

---

### Packages
These are some of my essentials 

- tmux
- alacritty
- neovim
- oh-my-zsh
- zsh
- zplug
- nvm
- rvm
- pip
- git
- gamescope
- gamemode
- rg
- fzf
- fd-find

--- 

### Symlinks 
This should be pretty self explanatory. Just basic configuration symlinks that allow us to keep everything in a dotfile repo.

```shell 

$ ln -s /path/to/repo/.fonts $HOME/.fonts

$ ln -s /path/to/repo/.tmux.conf $HOME/.tmux.conf

$ ln -s /path/to/repo/.zshrc $HOME/.zshrc 

$ ln -s /path/to/repo/nvim $XDG_CONFIG_HOME/nvim

$ ln -s /path/to/repo/alacritty.yml $HOME/.alacritty.yml

```
