# .bashrc
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# Get the aliases and functions {{{
if [ -f ~/.bashrc.win ]; then
    . ~/.bashrc.win
elif [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
#}}}
#User specific environment and startup programs {{{
export LD_LIBRARY_PATH='/usr/local/lib'
export LANG=ja_JP.UTF-8
export LOCAL_PREFIX=/usr/local
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_LOG_HOME="$HOME/.log"
cd
clear
#}}}
#Common {{{
shopt -s cdspell
export HISTFILE="$XDG_LOG_HOME/bash/bash_history"
alias cl='clear'
alias lc='clear'
alias cp='cp -i -p'
alias df='df -h'
alias diff='diff --color=always --ignore-all-space --ignore-blank-lines --ignore-space-change --ignore-tab-expansion --ignore-trailing-space --unified'
alias h='history'
alias mv='mv -i'
alias rm='rm -i'
alias tree='tree -af'
alias wget="wget --hsts-file=$XDG_LOG_HOME/wget/wget-hsts"
localPath=''
#}}}
#find {{{
findIgnore=''
findIgnore=${findIgnore}'    -type d -iname ".git"     -prune'
findIgnore=${findIgnore}' -o -type d -iname ".svn"     -prune'
findIgnore=${findIgnore}' -o -type d -iname "coverage" -prune'
findIgnore=${findIgnore}' -o -type f -iname "*.cache"  -prune'
findIgnore=${findIgnore}' -o -type f -iname "*.log"    -prune'
findIgnore=${findIgnore}' -o -type f -iname "*min.js"  -prune'
findIgnore=${findIgnore}' -o -type f -iname "*min.css" -prune'
alias FIND='find -L ./ '${findIgnore}' -o -type f -print0 | xargs -0 grep --color -i -I -n "$@"'
alias find='find -L'
#}}}
#htop {{{
if type htop >/dev/null 2>&1; then
    alias top='sudo htop'
fi
#}}}
#grep {{{
export GREP_OPTIONS='--color=auto -i -I'
export GREP_COLOR='1;33'
alias grep="grep $GREP_OPTIONS"
unset GREP_OPTIONS
#}}}
#xml {{{
export XMLLINT_INDENT='    '
#}}}
#history {{{
export HISTCONTROL=erasedups
export HISTSIZE=2000
export HISTTIMEFORMAT='%F %T '
#}}}
#less {{{
export LESS='--ignore-case --RAW-CONTROL-CHARS --no-init'
export LESSHISTFILE="$XDG_LOG_HOME/less/lesshst"
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;32m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[1;34m") \
        LESS_TERMCAP_so=$(printf "\e[1;35m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;33m") \
        man "$@"
}
#}}}
#PS1(primary prompt string) {{{
export PS1="\[\e[1;36m\]\u \$ \[\e[1;0m\]"
#}}}
#docker, tmux or screen {{{
if type docker >/dev/null 2>&1; then
    alias dcl="docker ps -a"
    alias dca="docker attach                           \"\$@\""
    alias dcr="docker run -d -i -t --privileged --name \"\$@\""
    alias dcs="docker start                            \"\$@\""
    alias dce="docker stop                             \"\$@\""
    alias drm="docker rm                               \"\$@\""
fi

if type tmux >/dev/null 2>&1; then
    alias tm="sh $HOME/work/dotfiles/src/tmuxStarter.sh"
    alias tml="tmux -u -f $XDG_CONFIG_HOME/tmux/tmux.conf list-sessions"
    alias tma="tmux -u -f $XDG_CONFIG_HOME/tmux/tmux.conf attach -d       \"\$@\""
    alias tmd="tmux -u -f $XDG_CONFIG_HOME/tmux/tmux.conf detach -s       \"\$@\""
    alias tmk="tmux -u -f $XDG_CONFIG_HOME/tmux/tmux.conf kill-session -t \"\$@\""
fi
if type screen >/dev/null 2>&1; then
    alias sc='screen'
    alias scl='screen -ls'
    alias sca='screen -r "$@"'
    alias scd='screen -d "$@"'
    export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
fi
#}}}
#Subversion {{{
export SUBVERSION_HOME="$XDG_CONFIG_HOME/subversion"
#}}}
#Mercurial {{{
export HGRCPATH="$XDG_CONFIG_HOME/hg/hgrc"
#}}}
#Atom {{{
export ATOM_DEV_RESOURCE_PATH="$XDG_CONFIG_HOME/atom/resource"
export ATOM_HOME="$XDG_CONFIG_HOME/atom/home"
#}}}
#MySQL {{{
export MYSQL_HISTFILE="$XDG_LOG_HOME/mysql/mysql_history"
#}}}
#Redis {{{
export REDISCLI_HISTFILE="$XDG_LOG_HOME/redis/rediscli_history"
#}}}
#Java {{{
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#}}}
#PHP {{{
export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
export PHAN_ALLOW_XDEBUG=1
if [ -d $XDG_CONFIG_HOME/composer/vendor/bin ]; then
    localPath="$XDG_CONFIG_HOME/composer/vendor/bin:$localPath"
fi
if [ -f $LOCAL_PREFIX/bin/composer.phar ]; then
    alias composer="php -d memory_limit=1G $LOCAL_PREFIX/bin/composer.phar"
else
    curl -sS https://getcomposer.org/installer | php -- --install-dir=$LOCAL_PREFIX/bin
fi
#}}}
#node.js {{{
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
if [ -d $XDG_CONFIG_HOME/npm/bin ]; then
    localPath="$XDG_CONFIG_HOME/npm/bin:$localPath"
fi
if [ -d $BREW_PREFIX/opt/nvm ]; then
    export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
#}}}
#Ruby {{{
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
localPath="$GEM_SPEC_CACHE/bin:$localPath"
#}}}
#Python {{{
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
#}}}
#PlantUML {{{
export PLANTUML_LIMIT_SIZE=8192
#}}}
#Gradle {{{
export GRADLE_USER_HOME="$XDG_CONFIG_HOME/gradle"
#}}}
#GnuPG {{{
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
#}}}
#MPlayer {{{
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
#}}}
#readline {{{
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
#}}}
#OS Type {{{
case "${OSTYPE}" in
    darwin*)
        export BREW_PREFIX=`brew --prefix`
        #command {{{
        alias l='ls  -AGh'
        alias ll='ls -AGhl'
        alias ls='ls -AGh'
        alias sl='ls -AGh'
        alias HTTPD='sudo apachectl'
        alias MYSQL='mysql.server'
        #}}}
        # export {{{
        export EDITOR=/usr/local/opt/macvim/MacVim.app/Contents/MacOS/vim
        export HOMEBREW_NO_ANALYTICS=1
        export LSCOLORS=DxgxcxdxcxCxfxBxFxhxfx
        export MYSQL_PS1="\d @\h> "
        #export MYSQL_PS1="\d @\h[\u] \n> "
        export TRAVIS_CONFIG_PATH="$XDG_CONFIG_HOME/travisci"
        export VAGRANT_HOME="$XDG_CACHE_HOME/vagrant/vagrant.d"
        export VIM=$HOME

        if [ -d $BREW_PREFIX/opt/macvim/bin ]; then
            alias vi=$BREW_PREFIX/opt/macvim/bin/gvim
        fi
        #rbenv
        if type rbenv >/dev/null 2>&1; then
            export RBENV_ROOT=$BREW_PREFIX/bin
            eval "$(rbenv init -)";
        fi
        #direnv
        if type direnv >/dev/null 2>&1; then
            eval "$(direnv hook bash)";
        fi

        ##brew --prefix bash-completion@2
        #if [ -f $BREW_PREFIX/share/bash-completion/bash_completion ]; then
        #    . $BREW_PREFIX/share/bash-completion/bash_completion
        #fi

        ##brew --prefix perl
        #if [ -d $BREW_PREFIX/opt/perl/bin ]; then
        #    localPath="$BREW_PREFIX/opt/perl/bin:$localPath"
        #    #PERL_MM_OPT="INSTALL_BASE=$HOME/.lib/perl" cpan local::lib
        #    #eval "$(perl -I$HOME/.lib/perl -Mlocal::lib)";
        #fi

        #brew --prefix ansible@2.8
        if [ -d $BREW_PREFIX/opt/ansible@2.8/bin ]; then
            localPath="$BREW_PREFIX/opt/ansible@2.8/bin:$localPath"
        fi
        #brew --prefix apr
        if [ -d $BREW_PREFIX/opt/apr/bin ]; then
            localPath="$BREW_PREFIX/opt/apr/bin:$localPath"
        fi
        #brew --prefix apr-util
        if [ -d $BREW_PREFIX/opt/apr-util/bin ]; then
            localPath="$BREW_PREFIX/opt/apr-util/bin:$localPath"
        fi
        #brew --prefix curl
        if [ -d $BREW_PREFIX/opt/curl/bin ]; then
            localPath="$BREW_PREFIX/opt/curl/bin:$localPath"
        fi
        #brew --prefix curl-openssl
        if [ -d $BREW_PREFIX/opt/curl-openssl/bin ]; then
            localPath="$BREW_PREFIX/opt/curl-openssl/bin:$localPath"
        fi
        #brew --prefix gnu-tar
        if [ -d $BREW_PREFIX/opt/gnu-tar/libexec/gnubin ]; then
            localPath="$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$localPath"
        fi
        #brew --prefix gnu-sed
        if [ -d $BREW_PREFIX/opt/gnu-sed/libexec/gnubin ]; then
            localPath="$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$localPath"
        fi
        #brew --prefix go
        if [ -d $BREW_PREFIX/opt/go ]; then
            export GOROOT="$BREW_PREFIX/opt/go/libexec"
            export GO111MODULE="on"
            localPath="$GOROOT/bin:$localPath"

            if [ -d $HOME/go ]; then
                export GOPATH="$HOME/go"
                localPath="$GOPATH/bin:$localPath"
            fi

            #goenv
            if [ -d $HOME/.goenv ]; then
                export GOENV_ROOT="$HOME/.goenv"
                localPath="$GOENV_ROOT/bin:$localPath"
            fi
        fi
        #brew cask google-cloud-sdk
        if [ -d $BREW_PREFIX/Caskroom/google-cloud-sdk ]; then
            source "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
            source "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
        fi
        #brew --prefix icu4c
        if [ -d $BREW_PREFIX/opt/icu4c/bin ]; then
            localPath="$BREW_PREFIX/opt/icu4c/bin:$BREW_PREFIX/opt/icu4c/sbin:$localPath"
        fi
        #brew --prefix libpq
        if [ -d $BREW_PREFIX/opt/libpq/bin ]; then
            localPath="$BREW_PREFIX/opt/libpq/bin:$localPath"
        fi
        #brew --prefix libiconv
        if [ -d $BREW_PREFIX/opt/libiconv/bin ]; then
            localPath="$BREW_PREFIX/opt/libiconv/bin:$localPath"
        fi
        #brew --prefix libxml2
        if [ -d $BREW_PREFIX/opt/libxml2/bin ]; then
            localPath="$BREW_PREFIX/opt/libxml2/bin:$localPath"
        fi
        #brew --prefix ncurses
        if [ -d $BREW_PREFIX/opt/ncurses/bin ]; then
            localPath="$BREW_PREFIX/opt/ncurses/bin:$localPath"
        fi
        #brew --prefix openldap
        if [ -d $BREW_PREFIX/opt/openldap/bin ]; then
            localPath="$BREW_PREFIX/opt/openldap/bin:$BREW_PREFIX/opt/openldap/sbin:$localPath"
        fi
        #brew --prefix openssl@1.1
        if [ -d $BREW_PREFIX/opt/openssl@1.1/bin ]; then
            localPath="$BREW_PREFIX/opt/openssl@1.1/bin:$localPath"
        fi
        #brew --prefix php@7.3
        if [ -d $BREW_PREFIX/opt/php@7.3/bin ]; then
            localPath="$BREW_PREFIX/opt/php@7.3/bin:$BREW_PREFIX/opt/php@7.3/sbin:$localPath"
        fi
        #brew --prefix python
        if [ -d $BREW_PREFIX/opt/python/libexec/bin ]; then
            localPath="$BREW_PREFIX/opt/python/libexec/bin:$localPath"
        fi
        #brew --prefix sqlite
        if [ -d $BREW_PREFIX/opt/sqlite/bin ]; then
            localPath="$BREW_PREFIX/opt/sqlite/bin:$localPath"
        fi
        #yarn
        if [ -d $HOME/.yarn/bin ]; then
            localPath="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$localPath"
        fi
        #git diff-highlight
        if [ -d $BREW_PREFIX/share/git-core/contrib/diff-highlight ]; then
            localPath="$BREW_PREFIX/share/git-core/contrib/diff-highlight:$localPath"
        fi
        export PATH=$localPath$PATH
        if type goenv >/dev/null 2>&1; then
            eval "$(goenv init -)"
        fi

        # ssh-agent {{{
        if [ -z "$SSH_AUTH_SOCK" ] ; then
            eval `ssh-agent`
            ssh-add -K $HOME/.ssh/id_rsa.pub
        fi
        #}}}

        ## git pull {{{
        gitPullVariable=''
        gitPullVariable="$gitPullVariable echo 'dotfiles' && cd $HOME/work/dotfiles/ && git fetch --prune && git pull;"
        gitPullVariable="$gitPullVariable echo 'go'       && cd $HOME/work/dotfiles/go/src/KazuakiM/dotfiles/ && go get -m -u;"
        gitPullVariable="$gitPullVariable echo 'composer' && cd $HOME && composer self-update && composer global update;"
        gitPullVariable="$gitPullVariable echo 'npm'      && cd $HOME && npm i -g npm && npm update -g;"
        gitPullVariable="$gitPullVariable echo 'homebrew' && cd $HOME && brew update && brew upgrade && brew cleanup && brew doctor && brew cask doctor;"
        gitPullVariable="$gitPullVariable cd;"
        alias UP=$gitPullVariable
        #}}}
        #}}}
        ;;
    linux*)
        # command {{{
        alias l='ls  -AhX  --color=auto'
        alias ls='ls -AhX  --color=auto'
        alias sl='ls -AhX  --color=auto'
        alias ll='ls -AhXl --color=auto'
        alias vi='vim'
        #}}}
        # export {{{
        export EDITOR=vim
        export MYSQL_PS1="\d> "
        if [ -d $LOCAL_PREFIX/rbenv/bin ]; then
            localPath="$LOCAL_PREFIX/rbenv/bin:$localPath"
        fi
        #git diff-highlight
        if [ -d /usr/share/doc/git/contrib/diff-highlight ]; then
            localPath="/usr/share/doc/git/contrib/diff-highlight:$localPath"
        fi
        export PATH=$localPath$PATH
        if type rbenv >/dev/null 2>&1; then
            export RBENV_ROOT=$LOCAL_PREFIX/rbenv
            eval "$(rbenv init -)";
        fi
        #}}}
        # PHP7.1 {{{
        if [ -d /opt/remi/php71 ]; then
            source /opt/remi/php71/enable
        fi
        #}}}
        ;;
    cygwin)
        # command {{{
        alias l='ls  -Ak  --color=auto'
        alias ls='ls -Ak  --color=auto'
        alias sl='ls -Ak  --color=auto'
        alias ll='ls -Akl --color=auto'
        alias vi="$HOME/src/vimStarter.sh"
        alias vim="$HOME/src/vimStarter.sh"
        alias gvim="$HOME/src/vimStarter.sh"
        #}}}
        # ssh-agent {{{
        if [ -f $HOME/.ssh/.ssh-agent ]; then
            . $HOME/.ssh/.ssh-agent > /dev/null
        fi
        if [ -z "$SSH_AGENT_PID" -o -z "`/usr/bin/ps -a|/usr/bin/egrep \"^[ ]+$SSH_AGENT_PID\"`" ]; then
            /usr/bin/ssh-agent > $HOME/.ssh/.ssh-agent
            . $HOME/.ssh/.ssh-agent > /dev/null
            ssh-add $HOME/.ssh/id_rsa
        fi
        #}}}
        ;;
esac
#}}}
