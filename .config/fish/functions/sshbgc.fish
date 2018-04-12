function sshbgc
  echo -n "Fetching celerybeat hostname... "
  set hostname (udeploy-client service instances background-check | grep beat | awk '{ print $6 }' | grep sjc)
  echo $hostname
  ssh $hostname
end
