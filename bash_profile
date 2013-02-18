# == Database Aliases
alias pgstart="pg_ctl -D /usr/local/var/postgres -l logfile start"
alias pgstop="pg_ctl -D /usr/local/var/postgres -l logfile stop"
alias dbacq="psql -U netcredit netcredit_acquisition_development"
alias dbid="psql -U netcredit netcredit_identity_development"
alias dbpf="psql -U netcredit netcredit_portfolio_development"

# == Logs
alias nclogs="tail -f /Users/npadilla/enova/netcredit/apps/*/log/*.log"

# == load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Because rvm's --defalut does not seem to be working
rvm use ruby-1.9.3-p194

# == Git
source ~/.git_completion.sh

export MANPATH="${MANPATH}:/usr/local/git/share/man/git-manpages"

alias gh="git lol"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias go="git checkout"

# == Pow
alias kill_pow="ps x | grep "Pow" | grep -v grep | cut -d' ' -f 1 | kill -9"
alias repow="powify server restart"
alias powid="powify restart identity.netcredit"
alias powac="powify restart acquisition.netcredit"
alias powpf="powify restart portfolio.netcredit"
alias powpt="powify restart portal.netcredit"
alias powah="powify restart account-home.netcredit"
alias powmf="powify restart mef.netcredit"
alias powmr="powify restart moriarty.netcredit"
alias powps="powify restart postal-service.netcredit"
alias powpg="powify restart payments.netcredit"

# == Bundle
alias be="bundle exec"
alias bi="bundle install"

# == NConjure
ncj () {
  pushd ~/enova/netcredit/gems/nconjure >/dev/null
  bin/ncj $@
  popd >/dev/null
}

# ===== from Josh =====
function josh_is_my_friend {
  alias j=jobs

  for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
  do
    alias "$i=fg %$i"
    alias "k$i=kill -9 %$i"
  done

  function k {
    for n in $@
    do
      kill -9 %$n
    done
  }
}

# == ALIASES
  # path
    alias     ..="cd .."
    alias    ...="cd ../.."
    alias   ....="cd ../../.."
    alias  .....="cd ../../../.."
    alias ......="cd ../../../../.."
      # -l  long format
      # -F  / after dirs, * after exe, @ after symlink
      # -G  colorize
      # -g suppress owner
      # -o suppress group
      # -h humanize sizes
      # -q print nongraphic chars as question marks
    alias l="ls -lFGgohq"

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


# == PROMPT
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
  }

  PS1="\[\033[37;45m\] \@ \[\033[0m\] \[\033[37;45m\] \w \[\033[0m\] \[\033[32;45m\]\$(parse_git_branch)\[\033[0m\]\n\$ \[\033[0m\]"

