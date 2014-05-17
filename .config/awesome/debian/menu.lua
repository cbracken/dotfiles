-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_アプリケーション_アクセシビリティ"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_アプリケーション_エディタ"] = {
	{"Emacs 23 (text)", "x-terminal-emulator -e ".."/usr/bin/emacs23 -nw"},
	{"Emacs 23 (X11)","/usr/bin/emacs23"},
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_アプリケーション_オフィス"] = {
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Debian_menu["Debian_アプリケーション_グラフィック"] = {
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_アプリケーション_サウンド"] = {
	{"Rhythmbox","/usr/bin/rhythmbox","/usr/share/pixmaps/rhythmbox-small.xpm"},
}
Debian_menu["Debian_アプリケーション_シェル"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh5"},
}
Debian_menu["Debian_アプリケーション_システム_システム管理"] = {
	{"DSL/PPPoE configuration tool", "x-terminal-emulator -e ".."/usr/sbin/pppoeconf","/usr/share/pixmaps/pppoeconf.xpm"},
	{"Editres","editres"},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"pppconfig", "x-terminal-emulator -e ".."su-to-root -p root -c /usr/sbin/pppconfig"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_アプリケーション_システム_セキュリティ"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_アプリケーション_システム_ハードウェア"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_アプリケーション_システム_パッケージ管理"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
}
Debian_menu["Debian_アプリケーション_システム_モニタリング"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_アプリケーション_システム_言語環境"] = {
	{"Input Method Configuration", "x-terminal-emulator -e ".."/usr/bin/im-config"},
}
Debian_menu["Debian_アプリケーション_システム"] = {
	{ "システム管理", Debian_menu["Debian_アプリケーション_システム_システム管理"] },
	{ "セキュリティ", Debian_menu["Debian_アプリケーション_システム_セキュリティ"] },
	{ "ハードウェア", Debian_menu["Debian_アプリケーション_システム_ハードウェア"] },
	{ "パッケージ管理", Debian_menu["Debian_アプリケーション_システム_パッケージ管理"] },
	{ "モニタリング", Debian_menu["Debian_アプリケーション_システム_モニタリング"] },
	{ "言語環境", Debian_menu["Debian_アプリケーション_システム_言語環境"] },
}
Debian_menu["Debian_アプリケーション_ターミナルエミュレータ"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"Rxvt-Unicode","rxvt-unicode","/usr/share/pixmaps/urxvt.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_アプリケーション_テキスト"] = {
	{"Character map","/usr/bin/gucharmap"},
}
Debian_menu["Debian_アプリケーション_データ管理"] = {
	{"ABook", "x-terminal-emulator -e ".."/usr/bin/abook"},
}
Debian_menu["Debian_アプリケーション_ネットワーク_ウェブブラウジング"] = {
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_アプリケーション_ネットワーク_コミュニケーション"] = {
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Remmina","/usr/bin/remmina"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_アプリケーション_ネットワーク_ファイル転送"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_アプリケーション_ネットワーク"] = {
	{ "ウェブブラウジング", Debian_menu["Debian_アプリケーション_ネットワーク_ウェブブラウジング"] },
	{ "コミュニケーション", Debian_menu["Debian_アプリケーション_ネットワーク_コミュニケーション"] },
	{ "ファイル転送", Debian_menu["Debian_アプリケーション_ネットワーク_ファイル転送"] },
}
Debian_menu["Debian_アプリケーション_ビデオ"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_アプリケーション_ビュワー"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"Shotwell","/usr/bin/shotwell"},
	{"Xditview","xditview"},
}
Debian_menu["Debian_アプリケーション_ファイル管理"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"Brasero","/usr/bin/brasero"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_アプリケーション_プログラミング"] = {
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Meld","/usr/bin/meld"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.4)", "x-terminal-emulator -e ".."/usr/bin/python3.4","/usr/share/pixmaps/python3.4.xpm"},
	{"Ruby (irb1.9.1)", "x-terminal-emulator -e ".."/usr/bin/irb1.9.1"},
	{"Tclsh8.6", "x-terminal-emulator -e ".."/usr/bin/tclsh8.6"},
	{"TkWish8.6","x-terminal-emulator -e /usr/bin/wish8.6"},
}
Debian_menu["Debian_アプリケーション_科学_数学"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_アプリケーション_科学"] = {
	{ "数学", Debian_menu["Debian_アプリケーション_科学_数学"] },
}
Debian_menu["Debian_アプリケーション"] = {
	{ "アクセシビリティ", Debian_menu["Debian_アプリケーション_アクセシビリティ"] },
	{ "エディタ", Debian_menu["Debian_アプリケーション_エディタ"] },
	{ "オフィス", Debian_menu["Debian_アプリケーション_オフィス"] },
	{ "グラフィック", Debian_menu["Debian_アプリケーション_グラフィック"] },
	{ "サウンド", Debian_menu["Debian_アプリケーション_サウンド"] },
	{ "シェル", Debian_menu["Debian_アプリケーション_シェル"] },
	{ "システム", Debian_menu["Debian_アプリケーション_システム"] },
	{ "ターミナルエミュレータ", Debian_menu["Debian_アプリケーション_ターミナルエミュレータ"] },
	{ "テキスト", Debian_menu["Debian_アプリケーション_テキスト"] },
	{ "データ管理", Debian_menu["Debian_アプリケーション_データ管理"] },
	{ "ネットワーク", Debian_menu["Debian_アプリケーション_ネットワーク"] },
	{ "ビデオ", Debian_menu["Debian_アプリケーション_ビデオ"] },
	{ "ビュワー", Debian_menu["Debian_アプリケーション_ビュワー"] },
	{ "ファイル管理", Debian_menu["Debian_アプリケーション_ファイル管理"] },
	{ "プログラミング", Debian_menu["Debian_アプリケーション_プログラミング"] },
	{ "科学", Debian_menu["Debian_アプリケーション_科学"] },
}
Debian_menu["Debian_ゲーム_おもちゃ"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_ゲーム_カードゲーム"] = {
	{"Gnome Solitaire Games","/usr/games/sol","/usr/share/pixmaps/aisleriot.xpm"},
}
Debian_menu["Debian_ゲーム"] = {
	{ "おもちゃ", Debian_menu["Debian_ゲーム_おもちゃ"] },
	{ "カードゲーム", Debian_menu["Debian_ゲーム_カードゲーム"] },
}
Debian_menu["Debian_ヘルプ"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian"] = {
	{ "アプリケーション", Debian_menu["Debian_アプリケーション"] },
	{ "ゲーム", Debian_menu["Debian_ゲーム"] },
	{ "ヘルプ", Debian_menu["Debian_ヘルプ"] },
}
