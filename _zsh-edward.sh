#compdef edward

zstyle ':completion:*:descriptions' format '%B%d%b'

zstyle ':completion::complete:edward:*:commands' group-name commands
zstyle ':completion::complete:edward:*:arguments' group-name arguments
zstyle ':completion::complete:edward:*:groups' group-name groups
zstyle ':completion::complete:edward:*:services' group-name services

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

__get_current_edward_groups() {
  local -a groups

  groups=( $(edward list | tail -n+2 | grep -Pzo --color=never 'Groups:(\n|.)*Services:' | awk 'NR>2 {print last} {last=$0}' | sed -e "s/[\t ]//g;/^$/d"))
  _describe -t groups "Groups" groups && ret=0

  unset groups
}

__get_current_edward_services() {
  local -a services

    services=( $(edward list | tail -n+2 | grep -Pzo --color=never 'Services:(\n|.)*' | awk 'NR>2 {print last} {last=$0}' | sed -e "s/[\t ]//g;/^$/d"))
  _describe -t services "Services" services && ret=0

  unset services
}


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

    case $state in
      first_arg)
        __describe_commands_arguments
        ;;
      second_arg)
        case $target in
          start|restart|stop)
            __get_current_edward_groups
            __get_current_edward_services
            ;;
          tail|tiplog)
            __get_current_edward_services
            ;;
          *)
            ;;
        esac
    esac

    return $ret
}

_edward "$@"

unset __describe_commands_arguments
unset __get_current_edward_groups
unset __get_current_edward_services
unset _edward


# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
