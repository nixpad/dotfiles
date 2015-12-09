# ALIASES
alias l="ls -lFGgohq"

alias gl="git pull"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias gu="git checkout"
alias gb="git branch"
alias gr="git remote"

alias be="bundle exec"
alias bi="bundle install"

alias bw="cd ~/bigcommerce/devbox"
alias appvm="cd ~/bigcommerce/bigcommerce-app-vm"
alias beec="cd ~/bigcommerce/bigcommerce-app-vm/codebases/bigcommerce"
alias auth="cd ~/bigcommerce/devbox/codebases/A-A"
alias apps="cd ~/bigcommerce/devbox/codebases/app-registry"
alias dp="cd ~/bigcommerce/devbox/codebases/developer-portal"
alias api="cd ~/bigcommerce/devbox/codebases/api-proxy-java"
alias hm="cd ~/bigcommerce/devbox/codebases/hooks-manager"
alias disp="cd ~/bigcommerce/devbox/codebases/webhooks-java"
alias theme="cd ~/bigcommerce/devbox/codebases/theme-registry"

alias dc="docker-compose"
alias usedport="lsof -i tcp:1234"

# git autocomplete
source ~/Documents/git_completion.sh

# homebrew
alias brew-formulas="open 'https://github.com/mxcl/homebrew/tree/master/Library/Formula'"

# give the fullpaths of files
  function fullpath {
    ruby -e '
      $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
      ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
    ' "$@"
  }

# Give it a # and a dir, it will cd to that dir, then `cd ..` however many times you've indicated with the number
# The number defaults to 1, the dir, if not provided, defaults to the output of the previous command
# This lets you find the dir on one line, then run the command on the next
  2dir() {
    last_command="$(history | tail -2 | head -1 | sed 's/^ *[0-9]* *//')"
    count="${1-1}"
    name="${2:-$($last_command)}"
    while [[ $count > 0 ]]
      do
        name="$(dirname "$name")"
        ((count--))
    done
    echo "$name"
    cd "$name"
  }

# take you to the dir of a file in a gem. e.g. `2gem rspec`
  2gem () {
    cd "$(dirname $(gem which $1))"
  }

# colors and git branch parsing
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

PS1="\[\033[37;45m\] \@ \[\033[0m\] \[\033[37;45m\] \w \[\033[0m\] \[\033[32;45m\]\$(parse_git_branch)\[\033[0m\]\n\$ \[\033[0m\]"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# open ports
alias openports="netstat -a | egrep 'Proto|LISTEN'"

# Set Java version
export JAVA_HOME="$(/usr/libexec/java_home)"

# Explicitly tell api-proxy-java to use this environment variable to find my certificate. Dunno why it's not looking here
export JAVA_TRUST_STORE="-Djavax.net.ssl.trustStore=/Users/nikka.padilla/bigcommerce/api-proxy-java/conf/cacerts.jks -Djavax.net.ssl.trustStorePassword=changeit"

# Instantiate rbenv
eval "$(rbenv init -)"

export ACKRC="~/.ackrc"

alias ctags="`brew --prefix`/bin/ctags"

export GOPATH="$HOME/coding/go-projects"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/sbin:$PATH"
export BOX_PATH=/Users/nikka.padilla/bigcommerce/devbox
source ~/.dev_profile
source ~/.nvm/nvm.sh
