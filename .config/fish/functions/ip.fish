function ip
  if test (uname) = 'Darwin'
    # BSD version of ip doesn't support colors
    command ip $argv
  else
    command ip -color=auto $argv
  end
end
