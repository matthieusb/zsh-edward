# Edward Zsh plugin

# WORK IN PROGRESS, not usable for now

This edward plugin aims at making [sdkman](https://sdkman.io) usage easier with completion scripts and aliases

TODO Add usage gif example
<!-- ![zsh-sdkman usage gif](./zsh-sdkman-usage.gif?raw=true "Optional Title") -->

## Installation

zsh-sdkman is not bundled with ZSH, so you need to install it.

### [Antigen](https://github.com/zsh-users/antigen)

This plugin can be installed by adding `antigen bundle matthieusb/zsh-edward` to your `.zshrc` file. [Antigen](https://github.com/zsh-users/antigen) will handle cloning the plugin for you automatically the next time you start `zsh`. You can also add the plugin to a running ZSH session with `antigen bundle matthieusb/zsh-edward` for testing before adding it to your `.zshrc`.

### [Zgen](https://github.com/tarjoilija/zgen)

This plugin can be installed by adding `zgen load matthieusb/zsh-edward` to your `.zshrc` file in the same function you're doing your other `zgen load` calls in. [Zgen](https://github.com/tarjoilija/zgen) will automatically clone the repositories for you when you do a `zgen save`.


### [Simple Oh-My-Zsh/Manual install](http://ohmyz.sh/)

Go to your *oh-my-zsh* folder and then in *custom/plugins* and clone this repository:

```
git clone https://github.com/matthieusb/zsh-edward.git
```

And then, add to to your *.zshrc* plugin list like this:

```
plugins=(... zsh-edward)
```

## Dependencies

TODO

## Usage

### First launch and completion update


### Usage help

Edward can be used as usual:

```
Usage:
  edward [command]

Available Commands:
  generate    Automatically generate Edward config for a source tree
  help        Help about any command
  list        List available services and groups
  restart     Rebuild and relaunch a service or a group
  start       Build and launch a service or a group
  status      Display service status
  stop        Stop a service or a group
  tail        Tail the log for a service
  tiplog      View the tip (last 5 lines) of multiple, or all services
  version     Displays the currently installed version of Edward

Flags:
  -b, --backend stringSlice   Choose a specific backend for a service or group, of the form '<service>:<backend name>'
  -c, --config PATH           Use service configuration file at PATH
  -h, --help                  help for edward

Use "edward [command] --help" for more information about a command.
```

Some aliases are available through this plugin:

```
TODO
```
