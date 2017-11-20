# Path to your oh-my-zsh installation.
export ZSH=/Users/nick/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/git:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

alias zshconfig="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias gci="git commit"
alias peets_proj="cd ~/Dev/Cardfree/Peets-iOS/"
alias lg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias lg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias lg="lg1"
alias cardfree_base="cd ~/Dev/Cardfree"
alias pod_39_install="pod _0.39.0_ install"
alias pod_39_update="pod _0.39.0_ update"
alias clear_stored_pods="rm -rf Pods/ Podfile.lock"
alias carthage_ios="carthage update --platform iOS"
alias carthage_debug="carthage update --platform iOS --configuration Debug"
alias carthage_update_swift_2_3="TOOLCHAINS=com.apple.dt.toolchain.Swift_2_3 carthage update --platform iOS"
alias carthage_build_swift_2_3="TOOLCHAINS=com.apple.dt.toolchain.Swift_2_3 carthage build --platform iOS"

alias deployBuildDD_old="TOOLCHAINS=com.apple.dt.toolchain.Swift_3_2 bundle exec fastlane deployBuild"
alias deployBuildDD="bundle exec fastlane deployBuild"

alias ui_sdk_swift_2_3_spec_lint="TOOLCHAINS=com.apple.dt.toolchain.Swift_2_3 pod spec lint --verbose --allow-warnings --sources=https://github.com/Cardfree/CAFSpecs,master"
alias private_spec_lint="pod spec lint --verbose --allow-warnings --sources=https://github.com/Cardfree/CAFSpecs,master"
alias private_lib_lint="pod lib lint --verbose --allow-warnings --sources=https://github.com/Cardfree/CAFSpecs,master"
alias private_repo_push="pod repo push CAFSpecs "
alias open_deep_link="xcrun simctl openurl booted "

alias bex="bundle exec"
alias git_delete_tag="git push origin :refs/tags/"

alias kill_simulators="launchctl remove com.apple.CoreSimulator.CoreSimulatorService || true"
alias sublime="open -a Sublime\ Text"

xcodeSimBuild() {
  if [[ "$1" = "-h" ]]; then
    echo "First param is workspace path, second is scheme name"
    echo "Usage: xcodeSimBuild appName.xcworkspace UAT"
    return
  fi

  xcodebuild -workspace "$1" -derivedDataPath ~/Desktop/sim_build -scheme "$2" -arch i386 -sdk iphonesimulator11.1
}

export TERM="xterm-256color"
export PATH=$PATH:/opt/local/bin

DEFUALT_USER="nick"

export GOPATH=$HOME/Dev/Learn/go
export PROVISIONING_HOME=/Users/nick/Library/MobileDevice/Provisioning\ Profiles

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# rbenv init
if which rbenv > /dev/null;
  then eval "$(rbenv init -)"
fi
export PATH="$HOME/.rbenv/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
