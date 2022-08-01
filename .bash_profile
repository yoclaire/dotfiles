# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Usage: brew shellenv
#
# Print export statements. When run in a shell, this installation of Homebrew will
# be added to your PATH, MANPATH, and INFOPATH.
#
# The variables HOMEBREW_PREFIX, HOMEBREW_CELLAR and HOMEBREW_REPOSITORY are
# also exported to avoid querying them multiple times. To help guarantee
# idempotence, this command produces no output when Homebrew's bin and sbin
# directories are first and second respectively in your PATH. Consider adding
# evaluation of this command's output to your dotfiles (e.g. ~/.profile,
# ~/.bash_profile, or ~/.zprofile) with: eval "$(brew shellenv)"
if command -v /opt/homebrew/bin/brew &> /dev/null; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v /usr/local/bin/brew &> /dev/null; then
	eval "$(/usr/local/bin/brew shellenv)"
else
	HOMEBREW_PREFIX=""
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Set options for Git bash completion
if [ -f "${HOMEBREW_PREFIX}/etc/bash_completion.d/git-completion.bash" ]; then
	# Set EnvVar so prompt displays Git status
	GIT_PS1_SHOWDIRTYSTATE=true
fi

# Add tab completion for many Bash commands
if command -v brew &> /dev/null && [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d";
	source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Set up fzf for fuzzy tab completion using **<TAB>
# Learn more at https://github.com/junegunn/fzf
if command -v fzf &> /dev/null; then
	# Setup fzf
	# ---------
	if [[ ! "$PATH" == *${HOMEBREW_PREFIX}/opt/fzf/bin* ]]; then
		export PATH="${PATH:+${PATH}:}${HOMEBREW_PREFIX}/opt/fzf/bin"
	fi

	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.bash" 2> /dev/null

	# Key bindings
	# ------------
	source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.bash"

	# Set additional commands to use fzf
	_fzf_setup_completion path ag
	_fzf_setup_completion path code
	_fzf_setup_completion path g ga git
	_fzf_setup_completion path s subl
	_fzf_setup_completion dir tree

	if [ -x "$HOMEBREW_PREFIX/bin/fd" ]; then
		# Use fd (https://github.com/sharkdp/fd) instead of the default find
		# command for listing path candidates.
		export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
		export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

		# - The first argument to the function ($1) is the base path to start traversal
		# - See the source code (completion.{bash,zsh}) for the details.
		_fzf_compgen_path() {
			fd --hidden --follow --exclude ".git" . "$1"
		}

		# Use fd to generate the list for directory completion
		_fzf_compgen_dir() {
			fd --type d --hidden --follow --exclude ".git" . "$1"
		}
	fi
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f "${HOMEBREW_PREFIX}/etc/bash_completion.d/git-completion.bash" ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Source SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Generic Colouriser
if [ -f "${HOMEBREW_PREFIX}/etc/grc.bashrc" ]; then
	. "${HOMEBREW_PREFIX}/etc/grc.bashrc"
fi

# Enable aws-cli completion
if [ -f "${HOMEBREW_PREFIX}/bin/aws_completer" ]; then
	complete -C aws_completer aws
fi

# Enable rbenv shims and autocompletion
# github.com/sstephenson/rbenv/
if command -v rbenv &> /dev/null; then eval "$(rbenv init -)"; fi

# Enable pipenv completion
if [ -f "${HOMEBREW_PREFIX}/bin/pipenv" ]; then
	eval "$(pipenv --completion)"
fi

# Enable Trellis virtualenv integration
# github.com/roots/trellis-cli#virtualenv
if command -v trellis &> /dev/null; then
	eval "$(trellis shell-init bash)"
fi

if command -v op &> /dev/null; then
	source <(op completion bash)
fi

# Depends on us having set the alias for tmux to start in control mode
# https://gitlab.com/gnachman/iterm2/-/wikis/tmux-Integration-Best-Practices#how-do-i-use-shell-integration
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
if [ -e "${HOME}/.iterm2_shell_integration.bash" ]; then
	source "${HOME}/.iterm2_shell_integration.bash"
fi
