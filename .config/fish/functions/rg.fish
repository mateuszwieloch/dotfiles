function rg --wraps rg
  if type -q kitty
    kitty +kitten hyperlinked_grep $argv
  else
    command rg $argv
  end
end
