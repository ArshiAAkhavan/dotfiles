######################################## VIM key binding for command edit in zsh #####
# bindkey -v
######################################## NVIM ########################################
alias vim='nvim'
######################################## PATH ########################################
# used for pipx
export PATH=$PATH:$HOME/.local/bin
######################################## starship ####################################
# . <(starship init zsh)
######################################## click #######################################
alias click="xdg-open"
alias clique="xdg-open"
######################################## fuck ########################################
. <(thefuck --alias)
######################################## zoxide ######################################
. <(zoxide init --cmd j zsh)
######################################## cargo #######################################
export PATH=$PATH:$HOME/.cargo/bin

######################################## uv ##########################################
function uvs {
  venv=$(uv venv --allow-existing  2>&1 | grep source | awk '{print$4}')
  source $venv
}

function uvi {
  uv pip install ipython
  uv run ipython
}

alias uvp="uv run ipython"
alias uvpy="uvp"
alias uvim="uv run nvim"


######################################## exa #########################################
EXA_WITH_DEFAULT_FLAGS="eza --sort Name --group-directories-first"
EXA_WITH_DEFAULT_FLAGS_WITH_HEADER="$EXA_WITH_DEFAULT_FLAGS -h"

alias l="$EXA_WITH_DEFAULT_FLAGS --sort Name --icons"
alias ll="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --long"
alias la="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --long --all"
alias lr="$EXA_WITH_DEFAULT_FLAGS --long --recurse"
alias lra="$EXA_WITH_DEFAULT_FLAGS --long --recurse --all"
alias lt="$EXA_WITH_DEFAULT_FLAGS --long --tree"
alias lta="$EXA_WITH_DEFAULT_FLAGS --long --tree --all"

alias ls="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --icons --all --all"

######################################## ripgrep ######################################
alias grep="rg"

######################################## bat ##########################################
alias cat="bat"
alias yaml='bat -l yaml'
alias json='bat -l json'
######################################## fzf ##########################################
. <(fzf --zsh)
######################################## copy #########################################
alias copy="wl-copy"
alias paste="wl-paste"
######################################## QRCode #######################################
alias qrcode="zbarimg -q --raw"
# uncomment for xorg:
# alias copy="xclip -sel clip"
######################################## name #########################################
function name {
  echo "$PWD/$1"
}


# ######################################### go #########################################
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/go/bin
#
#
# ##################################### ssh ############################################
# function kill_all_ssh_sessions {
#   kill `ps -aux | grep 'ssh ' | grep $(whoami) | awk '{print$2}'` -9
# }
#
# function ssh(){
#   if [[ "$1" == "kill" ]];then
#     kill_all_ssh_sessions
#   else
#     command ssh "$@"
#   fi
#
#   }
# ##################################### fuck ###########################################
# eval $(thefuck --alias)
# # eval $(thefuck --alias FUCK)
#
# ###################################### Highlight ####################################
# function hl(){
#   # Initialize an empty string
#   args_string=""
#
#   # Iterate over the command-line arguments
#   for arg in "$@"; do
#       # Append each argument to the string, separated by "|"
#       args_string+="$arg|"
#   done
#
#   grep -e "$args_string^"
#   echo "grep -e \"$args_string^\""
# }
#
# ###################################### yazi #########################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# ###################################### streams ####################################
alias first="awk '{print"\$"1}'"

# function skip  {
#   tee | tail -n +$(($1 + 1))
# }
#
function take {
  tee | awk "{print \$$1}"
}

# function add {
#  tee | awk '{sum += $1} END {print sum}'
# }
#
#
# ###################################### VPN ##########################################
# alias 'v2ray::iman'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman.json)'
# alias 'v2ray::iman2'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman2.json)'
# alias 'v2ray::iman3'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman3.json)'
# alias 'v2ray::iman4'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman4.json)'
# alias 'v2ray::usa'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c usa.json)'
#
#
# ###################################### warp #########################################
# alias 'warp'='export HTTP_PROXY=http://127.0.0.1:10809 HTTPS_PROXY=http://127.0.0.1:10809 && warp-terminal'
#
# ###################################### copilot cli ##################################
# # . <(gh copilot alias zsh)
#
source ~/.myenv.sh
#
#
# ###################################### ocaml ########################################
# # opam configuration
# [[ ! -r /home/ark/.opam/opam-init/init.zsh ]] || source /home/ark/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
#
# ###################################### nvm  ########################################
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 
#
#
