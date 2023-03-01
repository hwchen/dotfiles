 if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt off
# git prompt
#source ~/.zsh/zsh-git-prompt/zshrc.sh
#PROMPT='%m:%F{green}%1~%f$(git_super_status) > '
eval "$(starship init zsh)"

# Note for changing sound card:
# pacmd set-card-profile 7 input:analog-stereo
# pavucontrol

source ~/.zsh/zsh-nvm/zsh-nvm.plugin.zsh
source ~/.zsh/zsh-nix-shell/nix-shell.plugin.zsh

setopt histignorealldups sharehistory

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v
bindkey 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
#autoload -Uz compinit
#compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH=$PATH:$HOME/bin

# For Rust
export PATH=$PATH:$HOME/.cargo/bin

#Aliases
alias cat='bat -pp'
alias rst='fd ~/projects/rust'
alias blog='fd ~/projects/golang/src/github.com/hwchen/hwc'
alias web='fd ~/projects/golang/src/github.com/hwchen/hwchen.github.io'
alias journal='vim ~/Dropbox/journal'
alias ag='rg'
alias yta='youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg'
alias rr="reddit-focus"
alias find='~/.cargo/bin/fd'
alias tygem="wine .wine/drive_c/Program\ Files\ \(x86\)/TygemGlobal/TygemGlobal.exe &"
alias eh="fd ~/projects/escape-hatch"
alias 3q="fd ~/projects/three-qs/donuts"
alias liz="fd ~/src/lizzie && java -jar 'target/lizzie-0.6-shaded.jar'"
alias wcbc="fd ~/projects/rust/what-can-be-computed"


eval "$(hub alias -s)"

#Volume

alias vmute='amixer -D pulse sset Master 0%'
alias vu='amixer -D pulse sset Master 5%+'
alias vd='amixer -D pulse sset Master 5%-'
alias vh='amixer -D pulse sset Master 25%'
alias vmax='amixer -D pulse sset Master 100%'

#display
alias display='feh'

#Remove flow control
stty -ixon

#fn for cd ls
function fd () {
    cd $1 && ls --color --group-directories-first
}
alias ls='ls --color --group-directories-first'

# hub completions for git
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit

# Time
disable -r time
alias time='time -p'

# multimonitor setup

alias horizontal='xrandr --output HDMI-A-0 --rotate normal --auto --left-of DisplayPort-0 --output DisplayPort-0 --rotate normal'
alias vertical-left='xrandr --output HDMI-A-0 --rotate left --auto --left-of DisplayPort-0 --output DisplayPort-0 --rotate normal'
alias vertical-right='xrandr --output HDMI-A-0 --rotate normal --auto --left-of DisplayPort-0 --output DisplayPort-0 --rotate right'
alias vertical='xrandr --output HDMI-A-0 --rotate left --auto --left-of DisplayPort-0 --output DisplayPort-0 --rotate right'
alias one-screen='xrandr --output HDMI-A-0 --rotate left --auto'

# video sharing for constrained window
# https://unix.stackexchange.com/questions/152435/sharing-your-desktop-with-google-hangouts-dual-monitor-and-gnome-shell
# vlc \
#    --no-video-deco \
#    --no-embedded-video \
#    --screen-fps=20 \
#    --screen-top=32 \
#    --screen-left=0 \
#    --screen-width=4320 \
#    --screen-height=2160 \
#    screen://

# for mit vpn
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'

# for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYENV_ROOT="$HOME/.pyenv"

# for swift
export PATH="$HOME/tools/swift-5.1.3-RELEASE-ubuntu18.04/usr/bin/:$PATH"

# for zig
export PATH="$HOME/bin/zig/:$PATH"

# kitty ssh
# might be a bit dangerous, it's not a drop in for ssh
alias ssh='kitty +kitten ssh'

# use nvim
alias vim=nvim
# this also uses a .fdignore
export FZF_DEFAULT_COMMAND='~/.cargo/bin/fd --type f --hidden --follow --no-ignore-vcs --exclude zig-cache'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"

# source /home/hwchen/.ghcup/env

# helix
export HELIX_RUNTIME=~/.config/helix/runtime

# git recent branches
# TODO make a real history of branch checkouts w/ fuzzy search
alias bstack='f() { git reflog | grep checkout | grep -v rebase | cut -d " " -f 8 | zuniq - | head -${1} | cat -n };f'
alias bjmp='fn() { bstack ${1} | tail -1 | cut -f 2 | xargs git checkout  }; fn'
alias bb="bjmp 2"

# ripgrep w/ pigz
rgz() { rg --pre rg-pigz --pre-glob '*.gz' "$@"; }


if [ -e /home/hwchen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hwchen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# redshift
alias redshift-loc='redshift -l 42:-71'

# https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
