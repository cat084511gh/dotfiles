function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

get_script_dir() {
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  echo "$DIR"
}

# PS1
COLOR="119m" # GREEN
[ -n "$SSH_TTY" ] && COLOR="208m" # ORANGE if SSH connection
PS1="\[\e[0m\]\[\e[38;5;0m\]\[\e[48;5;$COLOR\] \W \[\e[0m\]\[\e[38;5;$COLOR\]\[\e[0m\]\[\e[1;31m\]\$(parse_git_branch)\n\[\e[00m\]\[\e[38;5;119m\]\[\e[0m\]$ "

REAL_BASHRC_DIR=$(get_script_dir)
export PATH=$REAL_BASHRC_DIR/bin:$PATH

BASHRC_FILES=($REAL_BASHRC_DIR/bashrc_load/.bashrc.*)

for file in "${BASHRC_FILES[@]}"; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

