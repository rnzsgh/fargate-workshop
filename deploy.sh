#!/bin/bash

BUCKET_NAME=public-fargate-intro-workshop

npm run build

aws s3 sync public/ s3://$BUCKET_NAME/

aws s3api list-objects --bucket $BUCKET_NAME --query 'Contents[].{Key:Key}' --output text | xargs -n 1 aws s3api put-object-tagging --bucket $BUCKET_NAME --tagging 'TagSet=[{Key=public,Value=yes}]' --key




