DOCS_DIR="$HOME/Documents"
SOURCE_DIR="$HOME/Source"

CURRENT_PROJECT_DIR="$SOURCE_DIR/ccca"

export DISPLAY=:0.0
export ARCHFLAGS='-arch x86_64'
export EDITOR='mate -w'
export GIT_EDITOR='mate -w'
export VISUAL='mate -w'
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export ANT_HOME="$SOURCE_DIR/java/apache-ant-1.7.0"
#export GROOVY_HOME="$SOURCE_DIR/java/groovy-1.0"
export M2_HOME="$SOURCE_DIR/java/apache-maven-2.2.1"
export ANDROID_HOME="$SOURCE_DIR/java/android-sdk-mac_x86-1.5_r3"

PATH="$HOME/Scripts"
PATH="$PATH:/usr/local/bin:/usr/local/sbin"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:$ANT_HOME/bin"
#PATH="$PATH:$GROOVY_HOME/bin"
PATH="$PATH:$M2_HOME/bin"
PATH="$PATH:$SOURCE_DIR/java/ec2-api-tools-1.3-34128/bin"
#PATH="$PATH:$ANDROID_HOME/tools"
PATH="$PATH:$HOME/Scripts/wireshark"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
export PATH

#export MANPATH="/usr/local/man:$MANPATH"
export CDPATH=".:$HOME:$SOURCE_DIR:$DOCS_DIR:$SOURCE_DIR/ruby:$SOURCE_DIR/javascript:$SOURCE_DIR/java:$SOURCE_DIR/cocoa"

export NODE_PATH="/usr/local/lib/node"

export LC_CTYPE=en_US.UTF-8

export IDEA_JDK=$JAVA_HOME
export RUBYMINE_JDK=$JAVA_HOME
export JDK_HOME=$JAVA_HOME

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
. `brew --prefix`/Library/Contributions/brew_bash_completion.sh

. ~/.aliases
. ~/.gitaliases
. ~/.ben_h_git_aliases

PS1="\w\$(parse_git_branch) $ "

pman() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}

# If I want colour in my prompt string:
#COL=32
#export PS1='\u\[\e[00;${COL}m\]@\[\e[00m\]\h \w \[\e[00;${COL}m\]\$\[\e[00m\] '
#COL=32
#export PS1='\[\e[00;${COL}m\]\u@\h \w \$\[\e[00m\] '

# readline settings
#bind "set completion-ignore-case on" 
#bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double-tabbing

export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s lithist

# From Marc Liyanage:
function c {
  shopt -q nocasematch || resetcase=1
  shopt -s nocasematch
  for i in *; do [ -d "$i" ] && [[ "$i" == *"$1"* ]] && cd "$i" && break; done
  [ $resetcase ] && shopt -u nocasematch
}

function railsapp {
  template=$1
  appname=$2
  shift 2
  rails $appname -m http://github.com/kef/rails-templates/raw/master/$template.rb $@
}

#export GEMDIR=`gem env gemdir`
#
# gemdoc() {
#   open $GEMDIR/doc/`$(which ls) $GEMDIR/doc | grep $1 | sort | tail -1`/rdoc/index.html
# }
#
# _gemdocomplete() {
#   COMPREPLY=($(compgen -W '$(`which ls` $GEMDIR/doc)' -- ${COMP_WORDS[COMP_CWORD]}))
#   return 0
# }

# TODO This is taking too long.
#complete -o default -o nospace -F _gemdocomplete gemdoc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion