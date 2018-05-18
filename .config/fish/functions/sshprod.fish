function sshprod
  if not set -q argv[1]
    echo "USAGE: sshprod SERVICE_NAME [HOST_TYPE]"
    echo "For example: sshprod asgard celerybeat"
    return
  end
  set service_name $argv[1]

  # if set -q argv[2]
  #   set host_type $argv[2]
  # else
    set host_type "$service_name-$argv[2]:production"
  # end

  echo "Defaulting to sjc1"
  echo -n "Fetching hostname for $service_name $host_type..."
  set hostname (udeploy-client service instances $service_name | grep $host_type | awk '{ print $6 }' | grep sjc1 | head -1)
  echo $hostname
  ssh $hostname
end
