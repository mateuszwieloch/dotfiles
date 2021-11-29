# Open particular project for editings
function vie
  if test (count $argv) -ge 1
    cd $argv[1]
  end
  if test $status -eq 0
    kitty @ set-tab-title (basename (pwd))
    vi .
  end
end
