function clone_tanium_cloud
  set GHE_HOST "git.corp.tanium.com"
  set GHE_ORGANIZATION tanium-cloud
  gh api --paginate "https://$GHE_HOST/api/v3/orgs/$GHE_ORGANIZATION/repos" | \
    jq 'map(select(.archived == false and .name != "aws-ec2-instance-connect-config"))' | \
    jq --raw-output '.[].ssh_url' | \
    xargs -L 1 git clone
end
