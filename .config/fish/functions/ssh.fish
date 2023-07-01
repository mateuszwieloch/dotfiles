# This script fixes error that may be displayed when trying to ssh to a server:
#
#   open terminal failed: missing or unsuitable terminal: xterm-kitty
#
# This is because most ssh clients do not automatically share terminfo files with the server.
function ssh
  if type -q kitty
    kitty +kitten ssh $argv
  else
    command ssh $argv
  end
end
