# shells
install-zsh:
	cp .aliases .colors .paths .profile .sh_functions .zprofile .zshrc ~/

install-bash:
	cp .aliases .bash_logout .bashrc .colors .paths .profile .sh_functions ~/

install-x:
	cp .Xdefaults .Xmodmap ~/

install-fontconf:
	cp .fonts.conf ~/
	fc-cache -f -v

# program config
install-git:
	cp -r .gitconfig .gitignore_global .tigrc ~/

install-astyle:
	cp .astylerc ~/

install-irssi:
	cp -r .irssi ~/

install-tmux:
	cp .tmux.conf ~/

install-screen:
	cp .screenrc ~/
