

echo " ____  _  _  _____ ___  _  ____ ___    ____  _____ _____ _   _ ____"
echo "| __ )| || ||___ // _ \/ |/ ___/ _ \  / ___|| ____|_   _| | | |  _ \ "
echo "|  _ \| || |_ |_ \ (_) | | |  | | | | \___ \|  _|   | | | | | | |_) |"
echo "| |_) |__   _|__) \__, | | |__| |_| |  ___) | |___  | | | |_| |  __/"
echo "|____/   |_||____/  /_/|_|\____\___/  |____/|_____| |_|  \___/|_|"
echo ""
echo ""
echo "[ + ] ( 1 ) - Herramientas"
echo "[ + ] ( 2 ) - Instalar"
echo "[ + ] ( 0 ) - Exit"
echo ""

read var_opcion
# VARS

pwd=`pwd`
usuario=`whoami`

if [ $var_opcion = 1 ]
then
	echo ""
	echo ""
	echo "[ + ] ( 1 ) - Cambiar Host"
	echo "[ + ] ( 2 ) - Cambiar IP"
	echo "[ + ] ( 3 ) - Cambiar resolv"
	echo ""

	read var_opcion1

	if [ $var_opcion1 = 1 ]
	then
		echo "nuevo nombre del host: "
		read new_hostname
		read old_hostname < /etc/hostname
		sudo sed -i "s/"$old_hostname"/"$new_hostname"/g" /etc/hostname
		sudo sed -i "s/"$old_hostname"/"$new_hostname"/g" /etc/hosts
		sudo hostname $new_hostname
	fi 

	if [ $var_opcion1 = 2 ]
	then
		echo "nueva IP ( def = 192.168.1.X ): "
		read new_address
			echo "nueva mascara (def = 255.255.255.0 ): "
		read new_netmask
			echo "nuevo gateway ( def = 192.168.1.1 ): "
		read new_gateway
			echo "nueva interfaz (def = eth0 ): "
			read new_interface
			sudo echo "
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
		sudo ifdown $new_interface
		sudo ifup $new_interface
		sudo systemctl restart networking.service
	fi

	if [ $var_opcion1 = 3 ]
	then
		# Resolv.conf
		echo "Nuevo servidor DNS: ( def = 8.8.8.8 ) "
		read new_dns
		echo "nameserver $new_dns " > /etc/resolv.conf
	fi
fi 


if [ $var_opcion = 2 ]
then
	export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	export TERM=xterm-256color
	echo ""
	echo ""
	echo '\033[32m install APTS + CAT + LSD ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		echo ""
		echo ""
		echo '\033[32m apts'
		# APTs
		sudo apt update -y
		sudo apt install -y neofetch python3-launchpadlib software-properties-common neovim sshfs vifm curl git-core htop wget neofetch tree fzf pip python-pip python3-pip npm ranger ueberzug ripgrep silver_searcher fd universal-ctags  lazy
		sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
		#CAT
		wget https://github.com/sharkdp/bat/releases/download/v0.19.0/bat_0.19.0_amd64.deb
		sudo dpkg -i bat_*
		rm bat_*
		wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
		sudo dpkg -i lsd_*
		rm lsd_*
		wget https://az764295.vo.msecnd.net/stable/92da9481c0904c6adfe372c12da3b7748d74bdcb/code_1.76.0-1677667493_amd64.deb
		sudo dpkg -i code_*
		rm code_*
		wget https://objects.githubusercontent.com/github-production-release-asset-2e65be/90902132/872b5742-ed80-46ec-88db-c9d13064cb10?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230303%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230303T021701Z&X-Amz-Expires=300&X-Amz-Signature=96172ecf7aca53933f9bf2f44253777eb7840c0c8cfa33b329872982b61f7486&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=90902132&response-content-disposition=attachment%3B%20filename%3Dflameshot-12.1.0-1.debian-10.amd64.deb&response-content-type=application%2Foctet-stream
		sudo dpkg -i flame*
		rm flame*
	fi
	echo ""
	echo ""
	echo '\033[32m install ZSH + ZSHRC ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		mkdir ~/.app_def
		mkdir ~/.app_def/zsh-plugins

		#ZSH
		sudo apt install zsh -y
		
		# OHMYZSH + FONTS & STYLES 
		sudo apt install curl -y
		sudo apt install wget -y
		sudo apt install fonts-powerline -y
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s
		git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
		
		#COPYS
		cp p10k.zsh ~/.p10k.zsh
		cp zshrc ~/.zshrc
		cp zellij ~/.app_def/zellij
		cp config.yaml ~/.app_def/config.yaml
		cp web-search.plugin.zsh ~/.app_def/zsh-plugins
		chmod a+x ~/.app_def/zellij
		sed -i "s/"!!!USER!!!"/$usuario/g" ~/.zshrc

		#PLUGIN
		cd ~/.app_def/zsh-plugins
		git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
		git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

		wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

		cd ~/.zsh
		git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
		git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

		wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
	fi
	echo ""
	echo ""
	echo '\033[32m apps ( !! alias ~/.zshrc )'
	echo '\033[32m install DOCKER + DOCKER COMPOSE ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		sudo apt -y update
		sudo apt -y install curl gnupg2 apt-transport-https software-properties-common ca-certificates
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
		echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list
		sudo apt -y update
		sudo apt install -y docker-ce docker-ce-cli containerd.io
		sudo apt install -y docker.io
		
		#Compose
		curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
		chmod +x docker-compose-linux-x86_64
		sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
		sudo systemctl enable docker --now
		sudo usermod -aG docker $USER
		echo "alias dexec='docker exec -i -t'" >> .zshrc
	fi
	echo ""
	echo ""
	echo '\033[32m SYNCS ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		sudo apt install -y sshfs rclone wireguard resolvconf
		echo '\033[32m rclone config' 
	fi
	echo ""
	echo ""
	echo '\033[32m apps ( !! alias ~/.zshrc )'
	echo '\033[32m install Osintgram ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		sudo apt-get install python3-venv
		mkdir ~/kali/
		mkdir ~/kali/APPS_KALI/
		cd ~/kali/APPS_KALI/
		git clone https://github.com/Datalux/Osintgram
		cd Osintgram
		pip3 install -r requirements.txt
		echo "alias osintgram='python3 ~/kali/APPS_KALI/Osintgram/main.py'"
		python3.11 -m pip install -r requirements.txt
		echo ""
		echo ""
		echo 'Manual: https://github.com/Datalux/Osintgram'
	fi
	echo ""
	echo ""
	echo 'install BREW ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		# BREW
		wget https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
		bash ./install.sh
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
		#brew install fig
	fi
	echo ""
	echo ""
	echo '\033[32m install FIG ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		brew install fig
	fi
	echo ""
	echo ""
	echo '\033[32m install AWESOME ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		echo '\n awesome \n'
		sudo apt -y update
		sudo apt install -y awesome xfce4-terminal arandr
		echo '\n apts \n'
		sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
		sudo apt install -y libxcb-dpms0-dev
		
		echo '\n nitrogen & polybar & picom & theme \n'
		sudo apt install -y nitrogen polybar picom i3lock #i3lock-everblush
		git clone https://github.com/VaughnValle/blue-sky

		echo '\n Rofi \n'
		sudo apt install -y rofi
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
		cp -r ./polybarR/* ~/.config/polybar
		cp ./picomR.conf ~/.config/picom.conf

		echo ""
		echo ""
		echo '\033[32m Polybar / Picom Virtual machine ( To install "YES" )'
		echo ""
		read yesno
		if [ $yesno = 'YES' ]
		then
			cp -r ./polybarVM/* ~/.config/polybar
			cp ./picomVM.conf ~/.config/picom.conf
		fi

		

		sed -i "s/"!!!USER!!!"/$usuario/g" ~/.config/awesome/rc.lua
		sed -i "s/"!!!USER!!!"/$usuario/g" ~/.config/polybar/scripts/target_to_hack.sh
		
		echo '\n Fonts \n'
		sudo add-apt-repository ppa:font-manager/staging
		sudo apt -y update
		sudo apt install -y  font-manager pamixer
		cd polybarVM/fonts
		sudo cp * /usr/share/fonts/truetype/
		cd ../..
		echo '\n NvChad \n'
		git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

		echo '\n Bloqueo \n'
		sudo apt install -y slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev i3lock-color
		git clone https://github.com/Raymo111/i3lock-color.git
		cd i3lock-color
		./build.sh
		./install-i3lock-color.sh
		cd ..
		rm -rfv i3lock-color
		echo ""
		echo ""
		echo '\033[32m DESCAARGAR https://www.opendesktop.org/p/1908883'
		sudo apt-get install -y fonts-material-design-icons-iconfont
		mkdir font
		cd font
		curl -o Iosevka.zip https://fontlot.com/downfile\?post_id\=105610\&post_slug\=iosevka-font-family\&pf_nonce\=aa4aa4d7d6
		unzip Iosevka.zip
		curl -o icomoon.zip https://codeload.github.com/Keyamoon/IcoMoon-Free/zip/refs/heads/master
		unzip icomoon.zip
		cp *.ttf ~/.local/share/fonts
		sudo cp *.ttf /usr/share/fonts
		cd IcoMoon-Free-master
		cp *.ttf ~/.local/share/fonts
		sudo cp *.ttf /usr/share/fonts		
		cd../..
		rm -rfv ./font
		

		echo ""
		echo ""
		echo '\033[32m configuar monitores'
		echo '\033[32m [bar]'
		echo '\033[32m monitor = ${env:MONITOR:eDP-1}'
	fi
	echo ""
	echo ""
	echo '\033[32m install Fonts ( To install "YES" )'
	echo ""
	read yesno
	if [ $yesno = 'YES' ]
	then
		# Fonts
		cd /usr/local/share/fonts
		sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
		sudo unzip Hack.zip
		sudo wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip
		sudo unzip VictorMonoAll.zip
		sudo mv VictorMonoAll/TTF/* .
		
		mkdir ~/.local/share/fonts
		cd ~/.local/share/fonts
		wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
		unzip Hack.zip
		wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip
		unzip VictorMonoAll.zip
		mv VictorMonoAll/TTF/* .
	fi
fi