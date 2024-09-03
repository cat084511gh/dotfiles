parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ $? -eq 0 ]]; then
    [[ $branch == main ]] && echo " [main]" || echo " [${branch%%-*}]"
  fi
}

# PS1
COLOR="119m" # GREEN
[ -n "$SSH_TTY" ] && COLOR="208m" # ORANGE if SSH connection
PS1="\[\e[38;5;$COLOR\]\W\[\e[0m\]\[\e[1;31m\]\$(parse_git_branch)\n\[\e[0m\]$ "

REAL_BASHRC_DIR=$(get_script_dir)
export PATH=$REAL_BASHRC_DIR/bin:$PATH

BASHRC_FILES=($REAL_BASHRC_DIR/bashrc_load/.bashrc.*)

for file in "${BASHRC_FILES[@]}"; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

