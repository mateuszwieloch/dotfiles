function title
  # Sets tab title by sending OSC code (system escape code)
  # \e = \033 = escape
  # ]2; = OSC 2 (set window title)
  echo -e "\e]2;$argv"

  # Prevent title from being changed in this session
  function fish_title
  end
end
