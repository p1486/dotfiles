### functions

function fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function update-plugins() {
    
    local plugindir
    cd ~/.zsh-plugins && plugindir=$(find ${1:-.} -path "*/\.*" -maxdepth 1 -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$plugindir" && git pull && cd

}
