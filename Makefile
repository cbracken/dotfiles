CONFIG_DIR=~/.config/nvim

vim-plug:
	curl -fLo ${CONFIG_DIR}/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
