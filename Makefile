mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir  := $(patsubst %/,%,$(dir $(mkfile_path)))

# shells
install-zsh:
	ln -s "$(mkfile_dir)/.aliases" ~/
	ln -s "$(mkfile_dir)/.colors" ~/
	ln -s "$(mkfile_dir)/.paths" ~/
	ln -s "$(mkfile_dir)/.sh_functions" ~/
	ln -s "$(mkfile_dir)/.zshenv" ~/
	ln -s "$(mkfile_dir)/.zprofile" ~/
	ln -s "$(mkfile_dir)/.zshrc" ~/
	ln -s "$(mkfile_dir)/.zlogin" ~/

install-x:
	ln -s "$(mkfile_dir)/.Xdefaults" ~/
	ln -s "$(mkfile_dir)/.Xmodmap" ~/

install-fontconf:
	ln -s "$(mkfile_dir)/.fonts.conf" ~/
	fc-cache -f -v

# program config
install-git:
	ln -s "$(mkfile_dir)/.gitconfig" ~/
	ln -s "$(mkfile_dir)/.gitignore_global" ~/
	ln -s "$(mkfile_dir)/.tigrc" ~/

install-astyle:
	ln -s "$(mkfile_dir)/.astylerc" ~/

install-irssi:
	ln -s "$(mkfile_dir)/.irssi" ~/

install-tmux:
	ln -s "$(mkfile_dir)/.tmux.conf" ~/

install-screen:
	ln -s "$(mkfile_dir)/.screenrc" ~/
