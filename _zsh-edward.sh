#compdef edward

zstyle ':completion:*:descriptions' format '%B%d%b'

zstyle ':completion::complete:edward:*:commands' group-name commands
zstyle ':completion::complete:edward:*:arguments' group-name arguments

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

__describe_commands_arguments() {
  local -a commands
  local -a arguments
  commands=(
    'generate: Automatically generate Edward config for a source tree'
    'help: Help about any command'
    'list: List available services and groups'
    'restart: Rebuild and relaunch a service or a group'
    'start: Build and launch a service or a group'
    'status: Display service status'
    'stop: Stop a service or a group'
    'tail: Tail the log for a service'
    'tiplog: View the tip (last 5 lines) of multiple, or all services'
    'version: Displays the currently installed version of Edward'
  )

  arguments=(
    '-b: [stringSlice] Choose a specific backend for a service or group, of the form "<service>:<backend name>"'
    '-c: [PATH] Use service configuration file at PATH'
  )

  _describe -t commands "Commands" commands && ret=0
  _describe -t arguments "Arguments" arguments && ret=0
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
        __describe_commands_arguments
        ;;
      second_arg)
        case $target in
          start)
          # TODO
            ;;
          *)
            ;;
        esac
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
