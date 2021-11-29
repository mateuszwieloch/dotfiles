function vii
  if test (count $argv) -ge 1
    cd $argv[1]
  end
  if test $status -eq 0
    kitty @ set-tab-title (basename (pwd))
    kitty @ new-window --keep-focus --cwd (pwd)
    kitty @ new-window --keep-focus --cwd (pwd)
    vi .
  end
end
