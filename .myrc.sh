
export PATH=$PATH:$HOME/.local/bin
####################################### cargo #######################################
export PATH=$PATH:$HOME/.cargo/bin

####################################### yarn #######################################
export PATH=$PATH:$HOME/.yarn/bin

######################################### go #########################################
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/go/bin
######################################### copy #######################################
alias copy="xclip -sel clip"


######################################### exa ########################################
EXA_WITH_DEFAULT_FLAGS="exa --sort Name --group-directories-first"
EXA_WITH_DEFAULT_FLAGS_WITH_HEADER="$EXA_WITH_DEFAULT_FLAGS -h"

alias l="$EXA_WITH_DEFAULT_FLAGS --sort Name --icons"
alias ll="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --long"
alias la="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --long --all"
alias lr="$EXA_WITH_DEFAULT_FLAGS --long --recurse"
alias lra="$EXA_WITH_DEFAULT_FLAGS --long --recurse --all"
alias lt="$EXA_WITH_DEFAULT_FLAGS --long --tree"
alias lta="$EXA_WITH_DEFAULT_FLAGS --long --tree --all"

alias ls="$EXA_WITH_DEFAULT_FLAGS_WITH_HEADER --icons --all --all"

######################################### ripgre #####################################
alias grep="rg"

######################################### bat ########################################
alias cat="batcat"

######################################### fd #########################################
alias fd="fdfind"

##################################### docker pull ####################################
function docker_pull_with_retry {
  while true
  do
    command docker pull $1
    if [[ $? -eq 0 ]];then
       break
    fi
  done
}
function docker_pull_mirror {
  IMAGE_MIRROR="dockerhub.ir/$1"
  while true
  do
    command docker pull $IMAGE_MIRROR
    if [[ $? -eq 0 ]];then
       break
    fi
  done
  docker tag $IMAGE_MIRROR $1
}

function docker(){
  if [[ "$1" == "pull" ]];then
    shift 1
    docker_pull_with_retry $1
  elif [[ "$1" == "get" ]];then
    shift 1
    docker_pull_mirror $1
  else
    command docker "$@"
  fi
}
##################################### ssh ############################################
function kill_all_ssh_sessions {
  kill `ps -aux | grep 'ssh ' | grep $(whoami) | awk '{print$2}'` -9
}

function ssh(){
  if [[ "$1" == "kill" ]];then
    kill_all_ssh_sessions
  else
    command ssh "$@"
  fi

  }
##################################### fuck ###########################################
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

##################################### digicloud ######################################
alias dgc=digicloud

###################################### parser #######################################
alias yaml='batcat -l yaml'
alias json='batcat -l json'

##################################### autojump #######################################
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
# ##################################### zoxide #######################################
# source ~/.zoxide.sh

###################################### editor ########################################
# k8s
export KUBE_EDITOR=nvim
# editor across sudo
export EDITOR=nvim

###################################### Highlight ####################################
function hl(){
  # Initialize an empty string
  args_string=""

  # Iterate over the command-line arguments
  for arg in "$@"; do
      # Append each argument to the string, separated by "|"
      args_string+="$arg|"
  done

  grep -e "$args_string^"
  echo "grep -e \"$args_string^\""
}

###################################### sotoon #######################################
source ~/.sotoon-rc.sh

###################################### yazi #########################################
function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

###################################### streams ####################################
alias first="awk '{print"\$"1}'"

function skip  {
  tee | tail -n +$(($1 + 1))
}

###################################### completion ###################################
# kubebuilder
# . <(kubebuilder completion zsh)
# . <(squashctl completion zsh)


###################################### VPN ##########################################
alias 'v2ray::iman'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman.json)'
alias 'v2ray::iman2'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c iman2.json)'
alias 'v2ray::usa'='(cd /home/ark/Downloads/v2ray && ./v2ray run -c usa.json)'


###################################### warp #########################################
alias 'warp'='export HTTP_PROXY=http://127.0.0.1:10809 HTTPS_PROXY=http://127.0.0.1:10809 && warp-terminal'
