function hosts
  if not set -q argv[1]
    echo "USAGE: hosts SERVICE_NAME [DATA_CENTER]"
    return
  end
  if set -q argv[2]
    set data_center "--dcs" $argv[2]
  end
  udeploy-client $data_center service instances $argv[1]
end
