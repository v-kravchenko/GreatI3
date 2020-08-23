# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Check if oh-my-zsh is installed
if [[ ! -d $HOME/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	mv .zshrc.pre-oh-my-zsh .zshrc
	if [[ ! -d /usr/share/fzf ]]; then
		# Installing FZF on arch, if fzf doesn't exist
		if [[ $(uname --kernel-release | grep "arch") ]]; then
			sudo pacman -Sy fzf
		fi
	fi
fi

# 256bit colorscheme support
if [ "$TERM" != "xterm-256color" ]; then
	export TERM=xterm-256color
fi


### TODO
if [[ -e $HOME/.todo ]]; then
	cat .todo | column -t -N ID,Task -s '\t'
else
	echo "If you want to have todo in your terminal\n enter todo --help"
	touch $HOME/.todo
	fi
	todoFunction() {
		case $1 in
			"--help")
				echo -e "\033[1mtodo\033[0m - is your todo in any terminal and any linux, because it is in your .zshrc\n"
				echo -e "\tFor creating a task you need to type 'todo --create \"nameOfTask\""
				echo -e "\tFor deleting a task you need to type 'todo --delete and ID of a task"
				;;
			"--create")
				echo -e "Write a task"
				read task
				echo -e "$(($(cat .todo | wc -l) + 1))\t $task" >> $HOME/.todo
				;;
			"-c")
				echo -e "Write a task"
				read task
				echo -e "$(($(cat .todo | wc -l) + 1))\t $task" >> $HOME/.todo
				;;
			"")
				cat .todo | column -t -N ID,Task -s '\t'
				;;
		esac
	}
alias -g todo=todoFunction
###

# Path to your oh-my-zsh installation.
export ZSH="/home/username77177/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
plugins=(git)

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

# FZF
source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh


# Autolaunch tmux
#if [[ -e /usr/bin/tmux ]]; then
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux
#fi
