function fish_user_key_bindings
  fish_hybrid_key_bindings

  # -M a bind mode that bind is used in
  # -m mode to change into after the binding is executed
  bind -M default H beginning-of-line
  bind -M default L end-of-line
end
