# General
export EDITOR=vim
export LANG=ja_JP.UTF-8
setopt nobeep
setopt nolistbeep
bindkey -e

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Complement
autoload -U compinit && compinit

# Colors
autoload colors && colors

# Prompt
local prompt_pwd="%B%F{blue}[%~]%f%b"$'\n'
local prompt_info="%n@%m"
local prompt_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
PROMPT="$prompt_pwd$prompt_info $prompt_mark "

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%1v|)"

# Auto cd
setopt auto_cd

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share:/usr/local/share/python:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Aliases
alias ll='ls -l'
alias la='ls -a'
alias be='bundle exec'
alias dh='df -h'

# My shell scripts
export PATH=~/.scripts:$PATH


# PostgreSQL
export PGDATA=/usr/local/var/postgres

# iTerm title
export DISABLE_AUTO_TITLE="true"
precmd() {
  shorten_pwd=${PWD/${HOME}/\~}
  echo -ne "\e]1;$USER@$HOST:$shorten_pwd"
}

# SSH
ssh-add
