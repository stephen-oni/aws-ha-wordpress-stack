#!/bin/bash
if [ -z "$1" ]; then echo "Error: Pass DB Password"; exit 1; fi
aws cloudformation deploy \
  --template-file infrastructure/wordpress-ha.yaml \
  --stack-name wordpress-ha-stack \
  --parameter-overrides DBPassword=$1 \
  --capabilities CAPABILITY_IAM
