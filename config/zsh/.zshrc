### zinit ###
typeset -gAH ZINIT
ZINIT[HOME_DIR]="$XDG_DATA_HOME/zinit"
ZINIT[ZCOMPDUMP_PATH]="$XDG_STATE_HOME/zcompdump"
source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

### history ###
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|history|jj?|lazygit|la|ll|ls|rm|rmdir|trash)($| )" ]]
}

### option ###
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_HISTORY
setopt GLOBDOTS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt MAGIC_EQUAL_SUBST
setopt NO_FLOW_CONTROL
setopt NO_SHARE_HISTORY
setopt INTERACTIVE_COMMENTS
setopt PRINT_EIGHT_BIT
setopt PUSHD_IGNORE_DUPS

### theme ###
zinit light sindresorhus/pure

### rbenv ###
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
### nodebrew ###
export PATH=$HOME/.nodebrew/current/bin:$PATH

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/takahiro.sakaguchi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    @'zdharma-continuum/null'
