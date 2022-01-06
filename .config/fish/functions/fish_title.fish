# The output is used as a tab name
# The first argument to fish_title contains the most recently executed foreground command as a string, if any.
function fish_title
  echo (basename $PWD)
end
