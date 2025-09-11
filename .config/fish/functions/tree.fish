function tree
  # -C color output using LS_COLORS, TREE_COLORS or built-in colors
  # -F append indicator to entries /=directory, *=executable, @=symbolic link
  command tree -CF $argv
end

