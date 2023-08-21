# Load Antigen
source ~/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

# Sublime
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thomasmathew/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thomasmathew/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thomasmathew/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thomasmathew/google-cloud-sdk/completion.zsh.inc'; fi

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

alias aws_whoami="aws sts get-caller-identity | jq"
alias aws_prod="export AWS_PROFILE=prod && aws_whoami"
alias aws_staging="export AWS_PROFILE=staging && aws_whoami"
alias aws_root="export AWS_PROFILE=default && aws_whoami"

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000