function default_branch
  git remote show origin | awk '/HEAD branch/ {print $NF}'
end
