# PortaOne support .bashrc (C) PortaOne, Inc.
# $Id: .bashrc,v 1.31 2010/05/07 08:33:50 delgod Exp $

umask	0022

alias	less='less -fn'
alias	rm='rm -i'
alias	df='df -h'
alias	du='du -h'
alias	ll='ls -ls'
alias   lh='ls -lhF'
alias	ver='[ -d .svn ] && svn status --show-updates --verbose || cvs status'
alias	trr='traceroute'
#alias	chme='sudo chown -R porta-one ~porta-one'
#alias	rpwd='/home/porta-billing/porta-admin.pl resetpwd porta-support ='
alias   grep='grep --color'
#alias   msql='mysql -u root -h porta-billing-master porta-billing'
#alias   ssql='mysql -u root -h porta-billing-slave -P3307 porta-billing'
#alias   sqlplus='rlwrap -b "" -f ~porta-one/etc/oracle.dict sqlplus'
#alias   asterisk-um='sudo asterisk -C /home/porta-um/etc/asterisk/asterisk.conf -r'

# Colour definitions for PS1 prompt
norm='\[\e[0m\]'

green='\[\e[32m\]'
cyan='\[\e[36m\]'
magenta='\[\e[35m\]'
lred='\[\e[31;1m\]'
lgreen='\[\e[32;1m\]'
lwhite='\[\e[37;1m\]'

timeC="\t"
userC="$cyan\u$norm"
hostC="$green\H$norm"
pathC="$lgreen\w$norm"

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

export PS1='\[\0337\033k\033\\\0338\]'"$timeC $relC$userC$sep1$hostC$sep2$pathC"\
"\`[ \$? = "0" ] || echo '$lred'\`$sep3"

if [ -n "$MYPS" ]; then
    export PS1=${MYPS/\\m/$rel}
fi

# Clean up 
unset norm green cyan magenta lred
unset lgreen lwhite timeC userC hostC 
unset pathC rel relC sep1 sep2 sep3

# via RT#65936
export HISTTIMEFORMAT='%h.%d %H:%M:%S '
shopt -s histappend 

# Enable sudo completion
complete -cf sudo

if [ -f /etc/profile ]; then
    . /etc/profile
fi

alias	ls='ls $LSOPTIONS'
alias	la='ls -a'
alias	ll='ls -lah'

# Enable git completion
source $HOME/.git-completion.bash
alias gti='git'
