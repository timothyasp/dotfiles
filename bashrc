source ~/.bash/aliases
#source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# usage: gfind '*.php' SearchString
gfind () { find . -name "${1}" -exec grep -Hin ${3} "${2}" {} \;; }
# #gfind () { find . -name "${1}" -a ! -wholename '*/.*' -exec grep -Hin ${3} "${2}" {} \; ; }
#gfind () { if [ $# -lt 2 ]; then files="*"; search="${1}"; else files="${1}"; search="${2}"; fi; find -P . -name "$files" -a ! -wholename '*/.*' -exec grep -Hin ${3} "$search" {} \; ; }


#export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview:$PATH

#export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/command:$PATH

#export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/jsbuilder:$PATH
