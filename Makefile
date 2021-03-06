.POSIX:

# path to this repo
REPO_DIR=src/cfg/dotfiles

# shells
install-zsh:
	ln -s "$(REPO_DIR)/.aliases" ~/
	ln -s "$(REPO_DIR)/.colors" ~/
	ln -s "$(REPO_DIR)/.paths" ~/
	ln -s "$(REPO_DIR)/.sh_functions" ~/
	ln -s "$(REPO_DIR)/.zlogin" ~/
	ln -s "$(REPO_DIR)/.zlogout" ~/
	ln -s "$(REPO_DIR)/.zprofile" ~/
	ln -s "$(REPO_DIR)/.zshenv" ~/
	ln -s "$(REPO_DIR)/.zshrc" ~/

# program config
install-git:
	ln -s "$(REPO_DIR)/.gitconfig" ~/
	ln -s "$(REPO_DIR)/.gitignore_global" ~/
	ln -s "$(REPO_DIR)/.tigrc" ~/

install-tmux:
	ln -s "$(REPO_DIR)/.tmux.conf" ~/

install-x:
	ln -s "$(REPO_DIR)/.Xdefaults" ~/
	ln -s "$(REPO_DIR)/.Xmodmap" ~/

install-mutt:
	ln -s $(REPO_DIR)/.mbsyncrc ~/
	ln -s $(REPO_DIR)/.msmtprc ~/
	ln -s $(REPO_DIR)/.muttrc ~/
	ln -s $(REPO_DIR)/.notmuch-config ~/
	ln -s $(REPO_DIR)/.urlview ~/
	chmod 600 ~/.msmtprc
	mkdir -p ~/.config
	ln -s $(REPO_DIR)/.config/mutt ~/.config/mutt
	mkdir -p ~/.cache/mutt/headers
	mkdir -p ~/.cache/mutt/bodies
	mkdir -p ~/.cache/mutt/tmp

install-fontconf:
	ln -s "$(REPO_DIR)/.fonts.conf" ~/
	fc-cache -f -v

install-astyle:
	ln -s "$(REPO_DIR)/.astylerc" ~/

install-irssi:
	ln -s "$(REPO_DIR)/.irssi" ~/

install-screen:
	ln -s "$(REPO_DIR)/.screenrc" ~/

.PHONY: install-zsh install-git install-tmux install-x install-fontconf install-astyle install-irssi install-screen
