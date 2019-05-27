#!/bin/bash

STACK_NAME=workshop

ACCOUNT_ID=$(aws sts get-caller-identity --output text --query 'Account')

ENV_NAME=dev

CERT_ARN=arn:aws:acm:us-east-1:$ACCOUNT_ID:certificate/44147128-b634-438f-85af-95dc39a1f0a4

DB_ENGINE=postgres
CACHE_ENGINE=redis

aws cloudformation create-stack \
  --stack-name $STACK_NAME \
  --template-body file://stack.cfn.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters \
  ParameterKey=DatabaseEngine,ParameterValue=$DB_ENGINE \
  ParameterKey=CacheEngine,ParameterValue=$CACHE_ENGINE \
  ParameterKey=CertificateArn,ParameterValue=$CERT_ARN


