OS=''
case "$OSTYPE" in
  darwin*)  OS='Mac' ;; 
  linux*)   OS='Linux'  ;;
  *)        OS='UNKNOWN' ;;
esac

umask 006
export PATH=.:~/bin:$PATH

# enable color support of ls and also add handy aliases
export CLICOLOR=1
export LSCOLORS=ExfxcxdxBxegedabagacad

if [ "$TERM" != "dumb" ]; then
    export PS1='\[\e[40m\e[1;32m\]\u\[\e[0m\][\[\e[0;31m\]\@\[\e[0m\]]\[\e[1;34m\]\w \[\e[1;30m\]\[\e[0m\]> \[\e[0m\]'
    alias ls='ls -FC --color=auto'
    alias ll='ls -Fahl --color=auto'
else
    export PROMPT_COMMAND=''
    export PS1='\u[\@]\w > '
    alias ls='ls -FC'
    alias ll='ls -Fahl'
fi


alias lv='ls -@aehilFG'
alias e='emacs'

alias socketmravery="ssh -D 9999 mravery@ootbdev.com"
alias mravery="ssh -i /Users/achan/.ssh/celestra_id_rsa mravery@sandbox.ootbdev.com"
alias uclaan="ssh uclaan@ootbdev.com"
alias ootbdv="ssh ootbdv@ootbdev.com"
alias ootbin="ssh ootbin@ps15318.dreamhost.com"
alias averych="ssh averych@ps15318.dreamhost.com"
alias sandbin="ssh sandbin@ps47226.dreamhost.com"
alias svnlog="edit ~avery/dev/svnLogFile"
alias yuicompress="java -jar ~avery/bin/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar"
alias router="ssh -p 2011 root@192.168.100.100"

srch (){ find . -type d \( -name "*temp" -o -name "*.svn*" -o -name ".git" \) -prune \
		-o \! \( -name "*.svn*" -o -name "._DS_Store" \) -print | xargs grep -I "$1"| cut -c 3- ; }
               
webify(){
    find .  -type d \( -name "content" -o -name "*temp" -o -name "*.svn*" \) -prune \
	-o \( -name "*.svn*" -o -name "*.git*" -o -name "*.DS_Store*" \) -prune \
	-o -path "*cgi-bin/php.ini*" -print -exec chmod 660 {} \; \
	-o -path "*cgi-bin/php-wrapper.fcgi" -print -exec chmod 755 {} \; \
	-o -name ".htaccess" -print -exec chmod 644 {} \; \
	-o -type d -print -exec chmod 775 {} \; \
	-o -type f -print -exec chmod 664 {} \; | cut -c 3- ;
}

## Mac only things
if [[ $OS = 'Mac' ]]; then

    #autojump
    # This shell snippet sets the prompt command and the necessary aliases
    if [ -f `brew --prefix`/etc/autojump ]; then
	. `brew --prefix`/etc/autojump
    fi

    # FUN
    fore(){
	php -c ~avery/dev/phpGolf/golf.ini $1
    }
    
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi


