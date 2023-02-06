

echo " ____  _  _  _____ ___  _  ____ ___    ____  _____ _____ _   _ ____"
echo "| __ )| || ||___ // _ \/ |/ ___/ _ \  / ___|| ____|_   _| | | |  _ \ "
echo "|  _ \| || |_ |_ \ (_) | | |  | | | | \___ \|  _|   | | | | | | |_) |"
echo "| |_) |__   _|__) \__, | | |__| |_| |  ___) | |___  | | | |_| |  __/"
echo "|____/   |_||____/  /_/|_|\____\___/  |____/|_____| |_|  \___/|_|"
echo ""
echo ""
echo "[ + ] ( 1 ) - Cambiar Host"
echo "[ + ] ( 2 ) - Cambiar IP"
echo "[ + ] ( 3 ) - Cambiar resolv"
echo "[ + ] ( 4 ) - Instalar ZSH/OMZsh" 
echo "[ + ] ( 5 ) - Instalar apts"
echo "[ + ] ( 6 ) - Awesome"
echo "[ + ] ( 0 ) - Exit"
echo ""

read var_opcion

# VARS
pwd=`pwd`
echo $pwd

if [ $var_opcion = 1 ]
then
    	echo "nuevo nombre del host: "
    	read new_hostname
    	read old_hostname < /etc/hostname
    	sed -i "s/"$old_hostname"/"$new_hostname"/g" /etc/hostname
    	sed -i "s/"$old_hostname"/"$new_hostname"/g" /etc/hosts
    	hostname $new_hostname
fi 

if [ $var_opcion = 2 ]
then
	echo "nueva IP ( def = 192.168.1.X ): "
	read new_address
    	echo "nueva mascara (def = 255.255.255.0 ): "
	read new_netmask
    	echo "nuevo gateway ( def = 192.168.1.1 ): "
	read new_gateway
    	echo "nueva interfaz (def = eth0 ): "
    	read new_interface
    	echo "
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback 

auto "$new_interface"
iface "$new_interface" inet static
	address "$new_address"
        netmask "$new_netmask"
        gateway "$new_gateway > /etc/network/interfaces
    ifdown $new_interface
    ifup $new_interface
    systemctl restart networking.service
fi

if [ $var_opcion = 3 ]
then
	# Resolv.conf
	echo "Nuevo servidor DNS: ( def = 8.8.8.8 ) "
	read new_dns
	echo "nameserver $new_dns " > /etc/resolv.conf
fi

if [ $var_opcion = 4 ]
then

    mkdir ~/.app_def
    mkdir ~/.app_def/zsh-plugins

    #ZSH
    sudo apt install zsh -y
    cp zshrc ~/.zshrc
    
    # OHMYZSH + FONTS & STYLES 
    sudo apt install curl -y
    sudo apt install wget -y
    sudo apt install fonts-powerline -y
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    
    #COPYS
    cp p10k.zsh.2 ~/.p10k.zsh
    cp zshrc ~/.zshrc
    cp zellij ~/.app_def/zellij
    cp config.yaml ~/.app_def/config.yaml
    cp web-search.plugin.zsh ~/.app_def/zsh-plugins
    chmod a+x ~/.app_def/zellij

    #PLUGIN
    cd ~/.app_def/zsh-plugins

    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
    
    # Fonts
    cd /usr/local/share/fonts
    sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    sudo unzip Hack.zip
    sudo wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip
    sudo unzip VictorMonoAll.zip
    sudo mv VictorMonoAll/TTF/* .
    
    mkdir ~/.local/share/fonts
    cd ~./local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip Hack.zip
    wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip
    unzip VictorMonoAll.zip
    mv VictorMonoAll/TTF/* .

    cd ~ 
    source ~/.zshrc	
fi

if [ $var_opcion = 5 ]
then

	echo ""
	echo ""
	echo "[ + ] ( 1 ) - All"
	echo "[ + ] ( 2 ) - Basic"

	read var_opcion_5
	export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	export TERM=xterm-256color
	apt update -y

	if [ $var_opcion_5 = 1 ]
	then
		# APTs
        apt install -y neovim vifm curl git-core htop wget neofetch tree fzf pip python-pip python3-pip npm ranger apt installueberzug ripgrep silver_searcher fd universal-ctags  lazy
		#CAT
		wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
		dpkg -i bat_*
		rm bat_*
		wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
		dpkg -i lsd_*
		rm lsd_*
	fi
		if [ $var_opcion_5 = 2 ]
	then
		# APTs 
        apt install -y neovim  vifm curl git-core  htop wget tree pip lazy
		#CAT
		wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
		dpkg -i bat_*
		rm bat_*
		wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
		dpkg -i lsd_*
		rm lsd_*
	fi
fi

if [ $var_opcion = 6 ]
then
	echo '\n apts \n'
	sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
	sudo apt install libxcb-dpms0-dev
	
	echo '\n nitrogen & polybar & picom & theme \n'
	sudo apt install -y nitrogen polybar picom i3lock #i3lock-everblush
	git clone https://github.com/VaughnValle/blue-sky

	echo '\n Rofi \n'
	sudo apt install rofi
	# Themes
	mkdir -p ~/.config/rofi/themes/
	git clone https://github.com/lr-tech/rofi-themes-collection.git
	cd rofi-themes-collection
	cp themes/* ~/.config/rofi/themes/
	cd ..

	echo '\n archivos \n'
	cp nord.rasi ~/.config/rofi/themes
	mkdir ~/.config/awesome
	cp ./awesome/* ~/.config/awesome
	mkdir ~/.config/polybar
	cp ./polybar/* ~/.config/polybar
	cp ./picom.conf/* ~/.config/

	echo '\n Fonts \n'
	sudo add-apt-repository ppa:font-manager/staging
	sudo apt-get update
	sudo apt-get install font-manager

	echo '\n NvChad \n'
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

	echo '\n Bloqueo \n'
	sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
	git clone https://github.com/sam87/slimlock-debian
	cd slimlock-debian
	sudo make
	sudo make install
	cd ..
	cd /blue-sky/slim
	sudo cp slim.conf /etc/
	sudo cp slimlock.conf /etc
	sudo cp -r default /usr/share/slim/themes
fi