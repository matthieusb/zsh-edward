#compdef sdk

zstyle ':completion:*:descriptions' format '%B%d%b'

# TODO See if we keep the following "zstyle" lines (try and find their actual effect)
# zstyle ':completion::complete:sdk:*:commands' group-name commands
# zstyle ':completion::all_candidates:sdk:*:all_candidates' group-name all_candidates
# zstyle ':completion::candidates_to_uninstall:sdk:*:candidates_to_uninstall' group-name candidates_to_uninstall
# zstyle ':completion::complete:sdk::' list-grouped

########################################################
##### UTILITY FUNCTIONS
########################################################

########################################################
##### FIRST ARG FUNCTIONS
########################################################

__describe_commands() {
  # TODO Change this

  local -a commands
  commands=(
    'install: install a program'
    'uninstall: uninstal an existing program'
    'list: list all available packages or  '
    'use: change the version of an existing program'
    'default: set a program default version'
    'current: display all programs current running version'
    'upgrade: upgrade all current programs or a particular one'
    'version: display current sdkman version'
    'broadcast: get the latest SDK release notifications'
    'help: display commands help'
    'offline: Toggle offline mode'
    'selfupdate: update sdkman itself'
    'flush: flush sdkman local state'
  )

  _describe -t commands "Commands" commands && ret=0
}

########################################################
##### SECOND ARG FUNCTIONS
########################################################

# TODO

########################################################
##### THIRD ARG FUNCTIONS
########################################################

# TODO

########################################################
##### MAIN FUNCTION AND EXECUTION
########################################################

function _edward() {
  local ret=1

  local target=$words[2]
  local candidate=$words[3]

  _arguments -C \
    '1: :->first_arg' \
    '2: :->second_arg' \
    && ret=0


    # TODO Develop necessary methods
    case $state in
      first_arg)
        __describe_commands
        ;;
      second_arg)
        case $target in
          start)
            # TODO
            ;;
          *)
            ;;
        esac
        ;;
    esac

    return $ret
}

_edward "$@"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
