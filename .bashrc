[ -n "$PS1" ] && source ~/.bash_profile

# Enable SCM Breeze
# Here to ensure non-interactive shells do scheduled tasks
# https://github.com/scmbreeze/scm_breeze/pull/335
export SCM_BREEZE_DISABLE_ASSETS_MANAGEMENT=false
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
