#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "powerlevel10k/powerlevel10k" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize)

ZSH_COLORIZE_STYLE="colorful"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias lr='ll -R'
alias bcat='batcat'
alias bus='fzf'
alias rmf='rm -rfv' 
alias nv='nvim -u ~/.app_def/nvim.conf'
alias openvpn='sudo openvpn'
alias apt='sudo apt'

#alias nvim='nvim -u ~/.app_def/nvim.conf'
alias install='dpkg -i '
alias whatip='curl https://ipinfo.io/ip' 
#alias apps='ls /usr/local/bin | grep "exe" && ls /usr/local/bin | grep "365"'
alias div='~/.app_def/zellij -c ~/.app_def/config.yaml options --disable-mouse-mode'
alias casa='xfreerdp /v:192.168.1.5 /u:!!!USER@MAIL!!! /cert-ignore /dynamic-resolution +auto-reconnect +clipboard +home-drive'

alias autopsy4='/home/!!!USER!!!/Documentos/apps/autopsy-4.6.0-linux/autopsy-4.18.0/bin/autopsy'
alias volatility='python2 ~/.local/bin/vol.py'
alias sherlock='python3 /home/!!!USER!!!/kali/APPS_KALI/sherlock/sherlock/sherlock.py'
alias sync='~/.sync.sh'

alias gitb='git config --global user.name "!!!USER!!!" ; git config --global user.email !!!USER!!!@proton.me ; git config --list'
alias gitc='git config --global user.name "!!!OTHERUSER!!!" ; git config --global user.email !!!OTHERUSER@MAIL!!! ; git config --list'

alias copy='xclip -sel clip'

alias wifiscan='nmcli dev wifi'
alias battery="acpi | awk '{print $4}' | awk -F ',' '{print $1 }'"

pkill kwalletd5

#source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zs

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.app_def/zsh-plugins/web-search.plugin.zsh 
source ~/.app_def/zsh-plugins/sudo.plugin.zsh
source ~/.app_def/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export TERM=xterm-256color
export LIBVIRT_DEFAULT_URI=qemu:///system

# Created by `pipx` on 2022-05-12 20:45:34
export PATH="$PATH:/home/!!!USER!!!/.local/bin"
nitrogen --restore
sleep 0,1
clear


function target(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/!!!USER!!!/.config/polybar/scripts/target
    export T=$ip_address
}

#echo " ____  _  _  _____ ___  _  ____ ___  "
#echo "| __ )| || ||___ // _ \/ |/ ___/ _ \ "
#echo "|  _ \| || |_ |_ \ (_) | | |  | | | |"
#echo "| |_) |__   _|__) \__, | | |__| |_| |"
#echo "|____/   |_||____/  /_/|_|\____\___/ "
#echo ""
#echo ""
#

neofetch
