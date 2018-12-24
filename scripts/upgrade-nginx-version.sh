#!bin/bash
#
# upgrade-nginx-version.sh <id> <ip address> <version>
#    script file for terraform vmware instance creation
#

set -eu

cat << EOF > inventory-vars
[instance-$1:vars]
nginx_version=$2
EOF
