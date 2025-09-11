function ls
  # -F append indicator to entries /=directory, *=executable, @=symbolic link
  command ls -F --human-readable --time-style=long-iso $argv
end
