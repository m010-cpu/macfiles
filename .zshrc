# p10k 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Starship
# eval "$(starship init zsh)"

# Architecture
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

# Homebrew
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 21)

# Android SDK
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
if [ -d $ANDROID_SDK_ROOT ]
then
  PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Node Version Manager (fnm)
eval "$(fnm env --use-on-cd)"

# Spicetify
export PATH=$PATH:/Users/m/.spicetify

# Load Time ZSH
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Bingchilling Script
export PATH=$PATH:/usr/local/sbin

# Sketchybar Functions
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# fzf
eval "$(fzf --zsh)"
_gen_fzf_default_opts() {
  local base03="#002b36"
  local base02="#073642"
  local base01="#586e75"
  local base00="#657b83"
  local base0="#839496"
  local base1="#93a1a1"
  local base2="#eee8d5"
  local base3="#fdf6e3"
  local yellow="#b58900"
  local orange="#cb4b16"
  local red="#dc322f"
  local magenta="#d33682"
  local violet="#6c71c4"
  local blue="#268bd2"
  local cyan="#2aa198"
  local green="#859900"

  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}
_gen_fzf_default_opts

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Reload
function reload(){
  source ~/.zshrc
}

# Atuin
eval "$(atuin init zsh)"

# Plugins
source /opt/homebrew/opt/zinit/zinit.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light atuinsh/atuin

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit
zinit cdreplay -q

# Completions
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --icons --color=always $realpath'

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls="eza --icons"
alias ll="eza -alh --icons"
alias tree="eza --icons --tree"
alias vim="nvim"
