function sasg
  echo -n "Fetching Asgard hostname in DCA..."
  set ASGARD_HOST (udeploy-client service instances asgard | grep beat | awk '{ print $6 }' | grep dca)
  echo $ASGARD_HOST
  echo -n "Running cerberus..."
  cerberus --enable-container-access --container-access-port=2345 2>/dev/null &
  sleep 7
  echo "DONE"
  compute-cli config set scope.host $ASGARD_HOST
  compute-cli exec --user root (compute-cli ps | grep asgard | awk '{ print $NF}')
end

