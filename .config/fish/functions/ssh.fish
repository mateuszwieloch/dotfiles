# This script fixes error that may be displayed when trying to ssh to a server:
#
#   open terminal failed: missing or unsuitable terminal: xterm-kitty
#
# This is because most ssh clients do not automatically share terminfo files with the server.
function ssh
  kitty +kitten ssh $argv
end
