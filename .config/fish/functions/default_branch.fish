function default_branch
  git remote show origin | rg 'HEAD branch: (.*)' --replace '$1' --trim
end
