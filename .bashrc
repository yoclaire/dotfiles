[ -n "$PS1" ] && source ~/.bash_profile;

# Enable SCM Breeze
# Here to ensure non-interactive shells do scheduled tasks
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
