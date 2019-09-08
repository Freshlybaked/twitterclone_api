#!/bin/bash
RESOURCE_ID=$(aws ec2 describe-instances --filters Name=tag:green,Values=true --query Reservations[*].Instances[*].InstanceId | jq -r '.[] | .[0]')
aws ec2 create-tags --resources $RESOURCE_ID --tags Key=blue,Value=true
aws ec2 delete-tags --resources $RESOURCE_ID --tags Key=blue,Value=true