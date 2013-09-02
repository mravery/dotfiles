# enable color support of ls and also add handy aliases
export CLICOLOR=1
export LSCOLORS=ExfxcxdxBxegedabagacad

#if [ "$TERM" != "dumb" ]; then
    export PS1='\[\e[40m\e[1;32m\]\u\[\e[0m\][\[\e[0;31m\]\@\[\e[0m\]]\[\e[1;34m\]\w \[\e[1;30m\]\[\e[0m\]> \[\e[0m\]'
    alias ls='ls -FC --color=auto'
    alias ll='ls -lhFa --color=auto'
#else
#    export PROMPT_COMMAND=''
#    export PS1='\u[\@]\w > '
#    alias ls='ls -FC'
#    alias ll='ls -lhFa'
#fi

export PATH=.:~/bin:$PATH

umask 006

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias lv='ls -@aehilFG'
#alias ls='ls -FC --color=auto '
#alias ll='ls -lhFa --color=auto'

export EDITOR='/usr/bin/edit'

# alias mysql='/opt/local/bin/mysql5'
# alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
# alias mysqlstop='/opt/local/bin/mysqladmin5 -u root shutdown'

# alias svn='/opt/local/bin/svn'
# alias svnadmin='/opt/local/bin/svnadmin'
# alias svnlook='/opt/local/bin/svnlook'
# alias svnserve='/opt/local/bin/svnserve'
# alias svnsync='/opt/local/bin/svnsync'
# alias svndumpfilter='/opt/local/bin/svndumpfilter'
# alias svnversion='/opt/local/bin/svnversion'

alias emacs='/usr/local/bin/emacs -nw'
alias e='/usr/local/bin/emacs -nw'

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

sshupload (){ cat "$1" | ssh "$2" 'sh -c "cat - >> ~/.ssh/authorized_keys"'
}

srch (){ find . -type d \( -name "*sphinx*" -o -name "*temp" -o -name "*.svn*" \) -prune \
				-o \! \( -name "*.svn*" -o -name "._DS_Store" \) -print | xargs grep -I "$1"| cut -c 3- ; }

webify(){
    find .  -type d \( -name "content" -o -name "*sphinx*" -o -name "*temp" -o -name "*.svn*" \) -prune \
	-o \( -name "*.svn*" -o -name "*.git*" -o -name "*.DS_Store*" \) -prune \
	-o -path "*cgi-bin/php.ini*" -print -exec chmod 660 {} \; \
	-o -path "*cgi-bin/php-wrapper.fcgi" -print -exec chmod 755 {} \; \
	-o -name ".htaccess" -print -exec chmod 644 {} \; \
	-o -type d -print -exec chmod 775 {} \; \
	-o -type f -print -exec chmod 664 {} \; | cut -c 3- ;
}


dewebify(){
    find . -name "*/.svn/*" -prune -o -type f -print -exec chmod 660 {} \; 
    find . -name "*/.svn/*" -prune -o -type d -print -exec chmod 770 {} \; 
    find . -name "*/.svn/*" -type f -print -exec chmod 660 {} \; 
    find . -name "*/.svn/*" -type d -print -exec chmod 770 {} \; 
}

cosvn(){
	svn checkout svn+ssh://averych@ootbdev.com/home/ootbin/sourceror/uclaan/$1/trunk .
}

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
