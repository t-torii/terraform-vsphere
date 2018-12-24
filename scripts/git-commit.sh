#!bin/bash

git diff --exit-code
ret=$?
if [ $ret -gt 0 ]; then
  git add terraform.tfstate
  git add *.tf
  git add inventory
  git add inventory-vars
  git commit -m 'terraform.tfstate change'
fi
