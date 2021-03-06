# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/blinking/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git battery)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Battery Prompt for the right side of the terminal
RPROMPT='$(battery_pct_prompt)'

#Useful string constants
export VPNPASS="F]*=Q+{wku+5Ar(P"
export VPNGROUPPASS="vqm2ZC54tuv8PmmZ"

#Useful javascript regular expressions
export CLOGREGEX="(\/\/)?( )?(console.log\(){1}.*(\)){1}(;)?"

#Aliases used for running local docker containers
alias docker-start="$HOME/Projects/docker/scripts/start.sh"
alias docker-init="$HOME/Projects/docker/scripts/init.sh"
alias docker-restart="$HOME/Projects/docker/scripts/restart.sh"
alias docker-stop="$HOME/Projects/docker/scripts/stop.sh"

#Aliases for local bash scripts
alias node-init="$HOME/Projects/scripts/node-init.sh"
alias job-init="$HOME/Projects/scripts/job-init.sh"

#Aliases for using git from the command line
alias gp="git push"
alias gpl="git pull"
alias ga="git add -A"
alias gc="git commit -m"
alias gh="git reset --hard"
alias gf="git fetch --all"
alias gcb="git checkout -b"

#Aliases for kubectl
alias kubessh1="ssh-add ~/Desktop/logs/private.pem"
alias kubessh2="ssh k8s@172.18.156.146"
alias kubeall="kubectl get pod -n blinking"
alias kubelog="kubectl logs -n blinking"

#Other aliases
alias blinking-vpn="sudo openvpn ~/Downloads/blinking-office-2020.ovpn"
alias dock-down="sudo ip link set dev br-9876b94b4d2f down"

#Tetris ahaha 
autoload -U tetriscurses

