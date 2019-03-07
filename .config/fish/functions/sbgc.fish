function sbgc
  echo -n "Fetching Background Check hostname in DCA..."
  set BGC_HOST (udeploy-client service instances background-check | grep beat | awk '{ print $6 }' | grep dca)
  echo $BGC_HOST
  echo -n "Running cerberus..."
  cerberus --enable-container-access --container-access-port=2345 2>/dev/null &
  sleep 7
  echo "DONE"
  compute-cli config set scope.host $BGC_HOST
  compute-cli exec --user root (compute-cli ps | grep background-check | awk '{ print $NF}')
end
