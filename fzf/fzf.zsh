export FZF_DEFAULT_OPTS='--bind ctrl-d:page-down,ctrl-u:page-up'
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

