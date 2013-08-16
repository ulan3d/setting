# PortaOne support .bashrc (C) PortaOne, Inc.
# $Id: .bashrc,v 1.31 2010/05/07 08:33:50 delgod Exp $

umask	0022
alias ls='ls --color=auto'
alias	less='less -fn'
alias	rm='rm -i'
alias	df='df -h'
alias	du='du -h'
alias	ll='ls -lh  --color=auto'
alias   lh='ls -lhF --color=auto'
alias	ls='ls $LSOPTIONS --color=auto'
alias	la='ls -lah --color=auto'
alias	ver='[ -d .svn ] && svn status --show-updates --verbose || cvs status'
alias	trr='traceroute'
#alias	chme='sudo chown -R porta-one ~porta-one'
#alias	rpwd='/home/porta-billing/porta-admin.pl resetpwd porta-support ='
alias   grep='grep --color --exclude-dir=I18N'
#alias   msql='mysql -u root -h porta-billing-master porta-billing'
#alias   ssql='mysql -u root -h porta-billing-slave -P3307 porta-billing'
#alias   sqlplus='rlwrap -b "" -f ~porta-one/etc/oracle.dict sqlplus'
#alias   asterisk-um='sudo asterisk -C /home/porta-um/etc/asterisk/asterisk.conf -r'

# Colour definitions for PS1 prompt
norm='\[\e[0m\]'

green='\[\e[32m\]'
lgreen='\[\e[32;1m\]'
cyan='\[\e[36m\]'
magenta='\[\e[35m\]'
lred='\[\e[31;1m\]'
lwhite='\[\e[37;1m\]'
yellow='\[\e[33m\]'

export LESS_TERMCAP_mb=$'\033[01;36m' 
export LESS_TERMCAP_md=$'\033[01;32m'
export LESS_TERMCAP_me=$'\033[0m' 
export LESS_TERMCAP_mu=$'\033[01;37m'
export LESS_TERMCAP_se=$'\033[0m' 
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;36m'

timeC="\t"
userC="$cyan\u$norm"
hostC="$green\H$norm"
pathC="$green\w$norm"

[ $EUID -eq 0 ] && sep1="$lred#$norm" || sep1="$lwhite@$norm"
sep2="$lwhite:$norm"
sep3=">$norm "

case `uname -s` in
    Linux)
        rel=""
        relC=""
        ;;
    FreeBSD)
        rel=""
        relC=""
        ;;
esac

# via RT#65936
export HISTTIMEFORMAT='%h.%d %H:%M:%S '
shopt -s histappend 

# Enable sudo completion
complete -cf sudo

if [ -f /etc/profile ]; then
    . /etc/profile
fi


# Enable git completion
source $HOME/.git-completion.bash
alias gti='git'
alias gst='git status'
alias gbr='git branch'
alias gck='git checkout'
alias gsh='git show'
alias gdf='git diff'
alias gl='git log --graph'
alias pdc='perldoc'

export PS1='\[\0337\033k\033\\\0338\]'"$timeC $relC$userC$sep1$hostC$sep2$pathC"\
"\`[ \$? = "0" ] || echo '$lred'\`$sep3"

if [ -n "$MYPS" ]; then
    export PS1=${MYPS/\\m/$rel}
fi

# Clean up 
unset norm green cyan magenta lred
unset lgreen lwhite timeC userC hostC 
unset pathC rel relC sep1 sep2 sep3
