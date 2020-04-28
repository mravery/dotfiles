################################################################################
## Needs Bash version 4 and higher for command-not-found
################################################################################
OS=''
case $OSTYPE in
  darwin*)  OS='Mac' ;;
  linux*)   OS='Linux'  ;;
  *)        OS='UNKNOWN' ;;
esac

umask 006
export PATH=.:~/bin:$PATH
export CLICOLOR=1

## The below  are dark solarized colors from
## https://github.com/seebi/dircolors-solarized. 'Solarized' is a
## theme: https://ethanschoonover.com/solarized/.
##
## Installation is as follows:
## 1. Download/clone the repository from https://github.com/seebi/dircolors-solarized.
## 2. `dircolors -b dircolors.ansi-dark` gives you the code below.
## 3. Copy this into your bashrc file.
##
## `ls` now uses the solarized-dark theme.

LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.sql=32:*.csv=32:*.sv=32:*.svh=32:*.v=32:*.vh=32:*.vhd=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.nef=33:*.NEF=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.odt=31:*.dot=31:*.dotx=31:*.ott=31:*.xls=31:*.xlsx=31:*.ods=31:*.ots=31:*.ppt=31:*.pptx=31:*.odp=31:*.otp=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:';
export LS_COLORS
export EDITOR="emacsclient -t -a ''"

## Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [[ "$TERM" != "dumb" ]]; then
    export PS1='\[\e[40m\e[1;33m\]\u@\h\[\e[0m\][\[\e[0;31m\]\@\[\e[0m\]]\[\e[1;34m\]\w \[\e[1;30m\]\[\e[0m\]> \[\e[0m\]'
else
    export PROMPT_COMMAND=''
    export PS1='\u[\@]\w > '
fi

if [[ $OS = 'Linux' ]]; then
    ls_linux="--color=always"
else
    ls_linux=""
fi

if [[ $OS = 'Mac' ]]; then
    ls_mac="-@"
else
    ls_mac=""
fi

alias ls="ls -F $ls_linux"
alias ll="ls -Fahl $ls_linux"
alias lv="ls -aehlFG $ls_mac $ls_linux"
alias e='emacs'
alias ec="emacsclient -t -a ''"
alias grep='grep -EI --colour'

################################################################################
## FUNCTIONS
################################################################################
## Displays all crontab jobs on system

crontab_all (){
    for user in $(cut -f1 -d: /etc/passwd); do
	echo $user;
	crontab -u $user -l;
    done
}

## Shortcut for find
srch (){ find . -type d \( -name "*temp" -o -name "*.svn*" -o -name ".git" \) -prune \
 		-o \! \( -name "*.svn*" -o -name "._DS_Store" \) -print0 | xargs -0 grep -EI -d "skip"  --colour=always "$1"| cut -c 3- ; }

## Alters the permissions to allow for web deployment
webify(){
    find .  -type d \( -name "content" -o -name "*temp" -o -name "*.svn*" \) -prune \
	-o \( -name "*.svn*" -o -name "*.git*" -o -name "*.DS_Store*" \) -prune \
	-o -path "*cgi-bin/php.ini*" -print -exec chmod 660 {} \; \
	-o -path "*cgi-bin/php-wrapper.fcgi" -print -exec chmod 755 {} \; \
	-o -name ".htaccess" -print -exec chmod 644 {} \; \
	-o -type d -print -exec chmod 775 {} \; \
	-o -type f -print -exec chmod 664 {} \; | cut -c 3- ;
}

## Compares two version strings
vercomp () {
    ## returns: 0 equal
    ##          1 ver1 > ver 2
    ##          2 ver1 < ver 2
    if [[ $1 == $2 ]]; then
        return 0
    fi

    # IFS (Internal Field Separator) Fields are separated by a '.'
    # ($var) notation means turn $var into an array according to the IFS.
    local IFS=.
    local i ver1=($1) ver2=($2)

    # fill empty fields in ver1 with zeros
    # ${#var[@]} = the number of elements in the array/var.
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
	# <num>#$var converts the value of $var to the base of <num>
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}
 ################################################################################
 ## LINUX (DEBIAN) ONLY
 ################################################################################

 if [[ $OS = 'Linux' ]]; then
     ### For autojump
     if [[ -f /usr/share/autojump/autojump.sh ]]; then
	 . /usr/share/autojump/autojump.sh
     fi
     ### For ssh-agent. MacOSX doesn't need this because keychain does this.
     SSH_ENV=$HOME/.ssh/environment

     # start the ssh-agent
     function start_agent {
	 echo "Initializing new SSH agent..."
	 # spawn ssh-agent
	 /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	 echo succeeded
	 chmod 600 "${SSH_ENV}"
	 . "${SSH_ENV}" > /dev/null
	 /usr/bin/ssh-add
     }

     if [[ -f "${SSH_ENV}" ]]; then
	 . "${SSH_ENV}" > /dev/null
	 ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
             start_agent;
	 }
     else
	 start_agent;
     fi
 fi

################################################################################
## MAC ONLY
################################################################################
if [[ $OS = 'Mac' ]]; then
    ### RESET PATH VARIABLE
    if [[ -x /usr/libexec/path_helper ]]; then
	PATH=""
	eval `/usr/libexec/path_helper -s`
	export PATH=.:~/bin:$PATH
    fi

    ### EMACS VERSION CHECK
    # make sure that we're working with emacs >= 24
    wanted_ver=24
    curr_ver=`emacs --version | grep -oE '[[:digit:]]+\.[.[:digit:]]*'`
    vercomp $curr_ver $wanted_ver

    # If vercomp returns 2, then our current emacs version isn't good enough.
    if [[ $? == 2 ]]; then
      if [[ -e '/usr/local/bin/emacs' ]]; then
	emacs_path='/usr/local/bin/emacs -nw'
      elif  [[ -e '/Applications/Emacs.app/Contents/MacOS/Emacs' ]]; then
	emacs_path='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
	emacsclient_path='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -a'
      else
        echo -n "EMACS VERSION OUT OF DATE: $curr_emacs_version. "
	echo 'Install a newer version.'
	emacs_path=''
      fi
      alias ec=$emacsclient_path
      alias emacs="$emacs_path"
      EDITOR=$emacsclient_path
    fi

    ### AUTOJUMP
    # This shell snippet sets the prompt command and the necessary aliases
    if [[ -f `brew --prefix`/etc/autojump.sh ]]; then
	. `brew --prefix`/etc/autojump.sh
    fi

    ###BASH COMPLETION
    if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    ### GIT COMPLETION
    if [[ -f ~/.git-completion.bash ]]; then
        . ~/.git-completion.bash
    fi

    ### FUN
    fore(){
	      php -c ~avery/dev/phpGolf/golf.ini $1
    }
    if [[ -f /usr/local/bin/archey ]]; then
        /usr/local/bin/archey -c -o
    fi

    export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

    if [[ -x /usr/local/bin/brew ]]; then
        export PATH=$PATH:/usr/local/sbin
    fi

fi

################################################################################
## HOME
################################################################################
alias waketv='wakeonlan 40:8D:5C:4E:81:87'
alias wakedisk='wakeonlan 00:11:32:0F:A8:26'

