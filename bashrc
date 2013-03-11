source ~/.bash/aliases
#source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

function xtitle()      # Adds some text in the terminal frame.
{
   case "$TERM" in
      *term | rxvt)
         echo -n -e "\033]0;$*\007" ;;
      *)  
         ;;
   esac
}

# aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'
alias ncftp="xtitle ncFTP ; ncftp"


# .. and functions
function man()
{
   for i ; do
      xtitle The $(basename $1|tr -d .[:digit:]) manual
      command man -F -a "$i"
   done
}


function extract()      # Handy Extract Program.
{
   if [ -f $1 ] ; then
      case $1 in
         *.tar.bz2)  tar xvjf $1     ;;
         *.tar.gz)   tar xvzf $1     ;;
         *.bz2)      bunzip2 $1      ;;
         *.rar)      unrar x $1      ;;
         *.gz)       gunzip $1       ;;
         *.tar)      tar xvf $1      ;;
         *.tbz2)     tar xvjf $1     ;;
         *.tgz)      tar xvzf $1     ;;
         *.zip)      unzip $1        ;;
         *.Z)        uncompress $1   ;;
         *.7z)       7z x $1         ;;
         *) echo "'$1' cannot be extracted via >extract<" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

function my_ip() # Get IP adresses.
{
   MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | \
      sed -e s/addr://)
   MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | \
      sed -e s/P-t-P://)
}

function ii()   # Get current host related info.
{
   echo -e "\nYou are logged on ${RED}$HOST"
   echo -e "\nAdditionnal information:$NC " ; uname -a
   echo -e "\n${RED}Users logged on:$NC " ; w -h
   echo -e "\n${RED}Current date :$NC " ; date
   echo -e "\n${RED}Machine stats :$NC " ; uptime
   echo -e "\n${RED}Memory stats :$NC " ; free
   my_ip 2>&- ;
   echo -e "\n${RED}Local IP Address :$NC" ;
   echo ${MY_IP:-"Not connected"}
   echo -e "\n${RED}ISP Address :$NC" ;
   echo ${MY_ISP:-"Not connected"}
   echo -e "\n${RED}Open connections
   :$NC "; netstat -pan --inet;
   echo
}



