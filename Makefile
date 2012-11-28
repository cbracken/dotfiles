# shells
install-zsh:
	cp .aliases .colors .paths .profile .sh_functions .zprofile .zshrc ~/

install-bash:
	cp .aliases .bash_logout .bashrc .colors .paths .profile .sh_functions ~/

# program config
install-irssi:
	cp -r .irssi ~/

install-tmux:
	cp .tmux.conf ~/

install-screen:
	cp .screenrc ~/
