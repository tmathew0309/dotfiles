# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Determine the operating system
OS="$(uname)"

# Source and load Antidote plugins
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
autoload -Uz promptinit && promptinit && prompt pure

# Sublime
if [ "$OS" = "Darwin" ]; then
	# macOS path
	alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
fi

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
