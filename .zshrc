# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Import custom env variables
[ -f "$HOME/.env_vars" ] && source "$HOME/.env_vars"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions nvm)

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update frequency

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/ozenc/Library/pnpm"
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

export EDITOR=nvim

eval $(opam env --switch=default)
[ -f "/Users/ozenc/.ghcup/env" ] && source "/Users/ozenc/.ghcup/env" # ghcup-env
