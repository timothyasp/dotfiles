
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

[[ -s "/Users/tasp/.rvm/scripts/rvm" ]] && source "/Users/tasp/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/command:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/jsbuilder:$PATH
