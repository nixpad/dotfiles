# == RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"

# == Pow
alias pgstart="pg_ctl -D /usr/local/var/postgres -l logfile start"
alias pgstop="pg_ctl -D /usr/local/var/postgres -l logfile stop"

# == Database Aliases
# ==== NetCredit
alias dbacq="psql -U netcredit netcredit_acquisition_development"
alias dbid="psql -U netcredit netcredit_identity_development"
alias dbpf="psql -U netcredit netcredit_portfolio_development"

alias ncacq="psql -h proddb-acquisition.netcredit.com -U netcredit__read_only -d acquisition_prod_nc"
alias ncid="psql -h proddb-identity.netcredit.com -U npadilla -d identity_prod_nc"
alias ncpf="psql -h proddb-portfolio.netcredit.com -U netcredit__read_only -d portfolio_prod_nc"
alias ncpt="psql -h proddb-portal.netcredit.com -U netcredit__read_only -d portal_prod_nc"
alias ncps="psql -h proddb-postal.enova.com -U netcredit__read_only -d postal_prod_eno"
alias ncpgs="psql -h proddb-payments.netcredit.com -U netcredit__read_only -d payments_prod_nc"
alias ncah="psql -h proddb-my.netcredit.com -U netcredit__read_only -d accounthome_prod_nc"

alias cnz="psql -h china-zhongwen-production.cko69p5mrvej.ap-southeast-1.rds.amazonaws.com -d zhongwen_prod_cn -U npadilla"

# ==== UK
alias ukprod="psql -h proddb.quickquid.co.uk -U npadilla -d cnuapp_prod_uk"
alias ukslave="psql -h slavedb.quickquid.co.uk -U npadilla -d cnuapp_prod_uk"
# ==== Zhongwen
alias zacq="psql -U china zhongwen_development"


# == Logs
alias nclogs="tail -f /Users/npadilla/enova/netcredit/apps/*/log/*.log"
alias pblogs="tail -f ~/enova/trogdor/*/log/*.log"
alias cnlogs="tail -f ~/enova/china/*/log/*.log"

# == Git
source ~/.git_completion.sh

export MANPATH="${MANPATH}:/usr/local/git/share/man/git-manpages"

alias gh="git lol"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias go="git checkout"
alias gl="git pull"
alias gc="git commit -m"
alias gb="git branch"
alias gf="git fetch"

# == VCR
alias vcrl="LIVE_TESTS=1 bundle exec cucumber"
alias vcrr="LIVE_TESTS=1 RECORD=1 bundle exec cucumber"

# == Pow
alias repow="powify server restart"
alias xpow="powify server stop"
alias gpow="powify server start"

# == Bundle
alias be="bundle exec"
alias bi="bundle install"

# == NConjure
ncj () {
  pushd ~/enova/netcredit/gems/nconjure >/dev/null
  bin/nconjure $@
  popd >/dev/null
}

# == GeekNote
alias gn="python ~/geeknote/geeknote.py"

# VPN
export FIX_VPN_POW=yes
export FIX_VPN_MINIRAISER=yes

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

  # give the fullpaths of files
    function fullpath {
      ruby -e '
        $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
        ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
      ' "$@"
    }


# == PROMPT
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
  }

  PS1="\[\033[37;45m\] \@ \[\033[0m\] \[\033[37;45m\] \w \[\033[0m\] \[\033[32;45m\]\$(parse_git_branch)\[\033[0m\]\n\$ \[\033[0m\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
