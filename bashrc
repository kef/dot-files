DOCS_DIR="$HOME/Documents"
SOURCE_DIR="$HOME/Source"

CURRENT_PROJECT_DIR="$SOURCE_DIR/ccca"

export DISPLAY=:0.0
export ARCHFLAGS='-arch x86_64'
export EDITOR='mate -w'
export GIT_EDITOR='mate -w'
export VISUAL='mate -w'
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export ANT_HOME="$SOURCE_DIR/java/apache-ant-1.7.0"
export GROOVY_HOME='/usr/local/Cellar/groovy/2.0.5/libexec'
export M2_HOME="$SOURCE_DIR/java/apache-maven-2.2.1"
export ANDROID_HOME="$SOURCE_DIR/java/android-sdk-mac_x86-1.5_r3"

PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin'
PATH="$HOME/Scripts:$PATH"
PATH="$HOME/.cabal/bin:$PATH"
PATH="/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home/bin:$PATH"
PATH="$PATH:/usr/local/share/npm/bin"
PATH="$PATH:/usr/local/mysql/bin"
PATH="$PATH:$ANT_HOME/bin"
PATH="$PATH:$GROOVY_HOME/bin"
PATH="$PATH:$M2_HOME/bin"
PATH="$PATH:$SOURCE_DIR/java/ec2-api-tools-1.3-34128/bin"
#PATH="$PATH:$ANDROID_HOME/tools"
PATH="$PATH:$HOME/Scripts/wireshark"
PATH="$PATH:/usr/X11/bin"
export PATH

#export MANPATH="/usr/local/man:$MANPATH"
CDPATH='.'
CDPATH="$CDPATH:$HOME"
CDPATH="$CDPATH:$SOURCE_DIR"
CDPATH="$CDPATH:$DOCS_DIR"
CDPATH="$CDPATH:$SOURCE_DIR/greenspan"
CDPATH="$CDPATH:$SOURCE_DIR/medrefer"
CDPATH="$CDPATH:$SOURCE_DIR/eventswarm"
CDPATH="$CDPATH:$SOURCE_DIR/opendata"
CDPATH="$CDPATH:$SOURCE_DIR/HIE"
CDPATH="$CDPATH:$SOURCE_DIR/mogeneration"
CDPATH="$CDPATH:$SOURCE_DIR/vlc"
CDPATH="$CDPATH:$SOURCE_DIR/terracotta"
CDPATH="$CDPATH:$SOURCE_DIR/suncorp"
CDPATH="$CDPATH:$SOURCE_DIR/ruby"
CDPATH="$CDPATH:$SOURCE_DIR/jruby"
CDPATH="$CDPATH:$SOURCE_DIR/javascript"
CDPATH="$CDPATH:$SOURCE_DIR/java"
CDPATH="$CDPATH:$SOURCE_DIR/cocoa"
CDPATH="$CDPATH:$SOURCE_DIR/devops"
CDPATH="$CDPATH:$SOURCE_DIR/css"
export CDPATH

#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"
export NODE_PATH='/usr/local/lib/node_modules'

# TODO Why did I set this? Default of en_AU.UTF-8 seems better.
#export LC_CTYPE=en_US.UTF-8

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home
export IDEA_JDK=$JAVA_HOME
export RUBYMINE_JDK=$JAVA_HOME
export JDK_HOME=$JAVA_HOME

# Required for rvm build of Ruby 1.8.7 to find XQuartz include files.
export CPPFLAGS=-I/opt/X11/include

# Define community OID to use when not defined.
export COMMUNITY_OID='1.2.36.129710685.1.90078'

# Local development mode for HIE projects.
export LOCAL_DEV='ooh yeah'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

. ~/.aliases
. ~/.git_aliases

. ~/.osx_defaults

PS1="\[\033[G\]\w\$(parse_git_branch) $ "
#PS1="\[\033[G\]\u@\h:\[\e[01;34m\]\W\[\e[00m\e[0;32m\]\$(parse_git_branch)\[\e[00m\]$ "

pman() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}

# If I want colour in my prompt string:
#COL=32
#export PS1='\u\[\e[00;${COL}m\]@\[\e[00m\]\h \w \[\e[00;${COL}m\]\$\[\e[00m\] '
#COL=32
#export PS1='\[\e[00;${COL}m\]\u@\h \w \$\[\e[00m\] '

# readline settings
#bind 'set completion-ignore-case on'
#bind 'set bell-style none' # No bell, because it's damn annoying
bind 'set show-all-if-ambiguous On' # this allows you to automatically show completion without double-tabbing

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

# TODO This is taking too long.
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
#
#complete -o default -o nospace -F _gemdocomplete gemdoc

[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
