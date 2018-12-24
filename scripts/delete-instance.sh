#!bin/bash
#
# delete-instance.sh <id>
#    script file for terraform vmware instance deletion
#

set -eu

if [ -e instance-$1.tf ]; then
  rm instance-$1.tf
  git add instance-$1.tf
fi
