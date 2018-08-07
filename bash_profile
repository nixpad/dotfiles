# ALIASES
alias l="ls -lFGgohq"

alias gh="cd ~/github"
alias gl="git pull"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias gu="git checkout"
alias gb="git branch"
alias gr="git remote"
alias lint='git status -s | cut -d" " -f3 | xargs rubocop -a'

alias be="bundle exec"
alias bi="bundle install"

# git autocomplete
# source ~/Documents/git_completion.sh

# Clear and precompile assets
alias assets="RAILS_ENV=test bin/rake assets:clobber assets:precompile"

# homebrew
# alias brew-formulas="open 'https://github.com/mxcl/homebrew/tree/master/Library/Formula'"

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

# open ports
alias openports="netstat -a | egrep 'Proto|LISTEN'"

# see used ports `sudo lsof -i tcp:$PORT`

# node
eval "$(nodenv init -)"

# brew
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/nixpad/bin:$PATH"
export PATH="bin:$PATH"

# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# export PATH="/Users/nixpad/.gem/ruby/2.0.0/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
