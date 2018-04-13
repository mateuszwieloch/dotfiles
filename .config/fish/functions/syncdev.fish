function syncdev
  ussh
  rm -rf ~/.boxer/locks
  boxer sync $VAGRANTNAME uber/src
end
