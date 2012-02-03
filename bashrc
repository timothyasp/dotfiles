source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# usage: gfind '*.php' SearchString
# #gfind () { find . -name "${1}" -exec grep -Hin ${3} "${2}" {} \;; }
# #gfind () { find . -name "${1}" -a ! -wholename '*/.*' -exec grep -Hin ${3} "${2}" {} \; ; }
gfind () { if [ $# -lt 2 ]; then files="*"; search="${1}"; else files="${1}"; search="${2}"; fi; find -P . -name "$files" -a ! -wholename '*/.*' -exec grep -Hin ${3} "$search" {} \; ; }

# use .bashrc for settings specific to one system
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
