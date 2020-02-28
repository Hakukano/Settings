#!/bin/bash

declare -A LINKS=(
    ['.bash_profile']='bash/bash_profile'
    ['.bashrc']='bash/bashrc'
    ['.config/git']='git'
    ['.config/nvim']='nvim'
    ['.config/starship.toml']='starship/starship.toml'
    ['.npmrc']='npm/npmrc'
    ['.scripts']='bash/scripts'
    ['.ssh/config']='ssh/config'
    ['.tmux.conf']='tmux/tmux.conf'
    ['.vim']="vim"
)

windows_local() { [[ -n "$WINDIR" ]]; }

# Cross-platform symlink function. With one parameter, it will check
# whether the parameter is a symlink. With two parameters, it will create
# a symlink to a file or directory, with syntax: link $linkname $target
slink_local() {
    if [[ -z "$2" ]]; then
        # Link-checking mode.
        if windows_local; then
            fsutil reparsepoint query "$1" > /dev/null
        else
            [[ -h "$1" ]]
        fi
    else
        # Link-creation mode.
        if windows_local; then
            # Windows needs to be told if it's a directory or not. Infer that.
            # Also: note that we convert `/` to `\`. In this case it's necessary.
            linkname=${1/\/c/C:}
            linkname=${linkname//\//\\}
            target=${2/\/c/C:}
            target=${target//\//\\}
            if [[ -d "$2" ]]; then
                cmd <<< "mklink /D "${linkname}" "${target} > /dev/null
            else
                cmd <<< "mklink "${linkname}" "${target} > /dev/null
            fi
        else
            # You know what? I think ln's parameters are backwards.
            ln -fvs "$2" "$1"
        fi
    fi
}

for src in ${!LINKS[@]}; do
    dest=${LINKS[$src]}
    mkdir -p $(dirname $HOME/$src)
    rm -f $HOME/$src
    slink_local $HOME/$src $PWD/$dest
done

local_settings=$HOME/.settings
local_alias="alias"
local_bashrc="extendrc"
local_function="function"
local_path="path"
mkdir -p $local_settings
[[ ! -e $local_settings/${local_alias}    ]]  &&  echo -e "#!/bin/bash\n# Local Aliases"    >  $local_settings/${local_alias}
[[ ! -e $local_settings/${local_bashrc}   ]]  &&  echo -e "#!/bin/bash\n# Local Bashrc"     >  $local_settings/${local_bashrc}
[[ ! -e $local_settings/${local_function} ]]  &&  echo -e "#!/bin/bash\n# Local Functions"  >  $local_settings/${local_function}
[[ ! -e $local_settings/${local_path}     ]]  &&  echo -e "#!/bin/bash\n# Local Paths"      >  $local_settings/${local_path}
exit 0
