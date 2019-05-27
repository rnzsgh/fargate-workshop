#!/bin/bash

BUCKET_NAME=public-fargate-intro-workshop

aws s3 cp stack.cfn.yml s3://$BUCKET_NAME/stack.cfn.yml

aws s3api put-object-tagging --bucket $BUCKET_NAME --key stack.cfn.yml --tagging 'TagSet={Key=public,Value=yes}'
