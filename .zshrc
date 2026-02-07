# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Import custom env variables
[ -f "$HOME/.env_vars" ] && source "$HOME/.env_vars"

export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git zsh-autosuggestions)

# ZSH Updates
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update frequency

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

source "$ZSH/oh-my-zsh.sh"

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Case-insensitive
zstyle ':completion:*' menu select  # Arrow-key navigation

# Directory navigation
setopt AUTO_PUSHD  # cd builds directory stack, use 'cd -<tab>' to navigate
setopt PUSHD_IGNORE_DUPS

# Use a minimal prompt in Cursor to avoid command detection issues
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  PROMPT='%n@%m:%~%# '
  RPROMPT=''
else
  [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
fi

# PATH configuration
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# aliases
alias vim="nvim"
alias lg="lazygit"
alias df="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" # https://web.archive.org/web/20240307132655/https://engineeringwith.kalkayan.com/series/developer-experience/storing-dotfiles-with-git-this-is-the-way/
alias ob="vim \"$OBSIDIAN_PATH\""
alias cc="claude"
alias ...='cd ../..'
alias ....='cd ../../..'

export EDITOR=nvim

# History
export HISTORY_IGNORE="(export*|ls*|ll*|la*|cd*|pwd|exit|clear|history|bg|fg|top|htop|tmux*|zed*|code*|cursor*|jobs|vim*|nvim*|..|*password*|*secret*|*key*|*token*|*auth*| *)"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY_TIME
setopt HIST_REDUCE_BLANKS

zshaddhistory() {
  emulate -L zsh
  ## uncomment if HISTORY_IGNORE
  ## should use EXTENDED_GLOB syntax
  # setopt extendedglob
  [[ $1 != ${~HISTORY_IGNORE}[[:space:]] ]]
}

# Zsh compdump
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
