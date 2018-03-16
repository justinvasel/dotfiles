#///////////////////////////////////////////////////////////////////////////////
#
# JUSTIN'S AWESOME .ZSHRC FILE
#
#
#///////////////////////////////////////////////////////////////////////////////

# //////////////////////////////////////////////////////////////////////////////
# ANTIGEN -- Plugin manager for zsh
source ~/.dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh             # Load the oh-my-zsh's library.
antigen theme nicoulaj            # Load the theme.
antigen bundle colorize           # cat with syntax highlight support
antigen bundle cp                 # cp with progress bar (rsync)
antigen bundle git                # enchancements for git
antigen bundle web-search         # google from cli
antigen bundle nyan               # Try it, I dare you.
antigen apply                     # Tell antigen that you're done.


#///////////////////////////////////////////////////////////////////////////////
# ENVIRONMENT
export EDITOR=vim                 # Death to emacs. ¡Viva Vim!

### OS X Color Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'

### Configure PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/get-cert:$PATH

### Homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

### ZSH
ENABLE_CORRECTION="true"          # Enable command auto-correction.
COMPLETION_WAITING_DOTS="true"    # Display red dots whilst waiting for completion.


# //////////////////////////////////////////////////////////////////////////////
# ALIASES
source ~/.aliases
source ~/.aliases-ssh             # SSH shortcuts (private for security)
source ~/.aliases-sensitive       # General private (for security) shortcuts


# //////////////////////////////////////////////////////////////////////////////
# KEY BINDING
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -v
bindkey '^R' history-incremental-search-backward


# MISCELLANEOUS
# //////////////////////////////////////////////////////////////////////////////
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Colorize man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# Forgot why I needed this, but I assume it's important...
PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;

# Fixes weird ^M problem when pressing <enter> in some contexts
# Update 2018-03-16: No it doesn't...
stty sane

# Z.sh
. `brew --prefix`/etc/profile.d/z.sh

# Note: Syntax highlighting for zsh must be the final part. It's ornary.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
