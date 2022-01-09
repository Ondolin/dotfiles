# Path to your oh-my-zsh installation.
export ZSH="/Users/kaiser/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"

#Standard:robbyrussell 
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

IST_STAMPS="yyyy-mm-dd"

plugins=(git fzf cp rust zsh-autosuggestions)


source $ZSH/oh-my-zsh.sh
source ~/Development/tools/cli-tools/goto/goto.sh

# User configuration

export LANG=en_US.UTF-8
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR='nvim'

zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$PWD" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Source goto
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
source ~/.config/mcfly.zsh

# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh --cmd cd)"

source ~/.zsh_alias
