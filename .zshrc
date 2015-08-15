# ~/.zshrc

# colors
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
NC='\e[0m'

# aliases
alias boxgen='perl ~/scripts/boxgen.pl'
alias net='sudo sh ~/scripts/net.sh'
alias fetch='sh ~/scripts/fetch.sh'
alias invaders='sh ~/scripts/invaders.sh'
alias pacmayne='sh ~/scripts/pman.sh'
alias rain='sh ~/scripts/rain.sh'
alias pipes='sh ~/scripts/pipes.sh'
alias imgur='sh ~/scripts/imgur.sh'

# grsecurity/gradm RBAC
rbac_auth() {
    local auth_to_role='cute'
    if [ "${USER}" = 'root' ]; then
        if ! grep -qE '^RBAC:' "/proc/self/status" && command -v gradm > /dev/null 2>&1; then
            echo -e "\n* RBAC - Authorize to '${auth_to_role}' RBAC role."
            gradm -a "${auth_to_role}" && exec "${SHELL}" "$@"
        fi
    fi
}
rbac_auth

# wallpaper
feh --bg-fill ~/pictures/crux.jpg

# prompt
PS1="> "

# rm -rf ~/.bash*
