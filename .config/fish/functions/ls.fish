function ls
  # -F append indicator to entries /=directory, *=executable, @=symbolic link
  # -h humanly readable file sizes
  command ls -Fh $argv
end
