function fish_user_key_bindings
  fish_hybrid_key_bindings

  bind -M insert -m default jk backward-char force-repaint
end
