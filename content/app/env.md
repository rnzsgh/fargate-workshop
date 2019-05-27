---
title: "Environment"
date: 2018-08-07T12:37:34-07:00
weight: 10
---

Now that we have the base Fargate cluster and related resources deployed, we are going to pull the output from the
CloudFormation stack, so that we can configure the Fargate tasks and service.


```
export STACK_NAME=workshop
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query 'Account')
export REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
aws configure set default.region ${REGION}

export CLUSTER_NAME=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`FargateClusterName`].OutputValue' --output text)

export TARGET_GROUP_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TargetGroupArn`].OutputValue' --output text)

export VPC_ID=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`VpcId`].OutputValue' --output text)

export TASK_EXEC_ROLE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TaskExecutionRoleArn`].OutputValue' --output text)

export TASK_ROLE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TaskRoleArn`].OutputValue' --output text)

export LOG_GROUP=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`FargateLogGroupName`].OutputValue' --output text)

export SUBNET_0=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PublicSubnet0`].OutputValue' --output text)

export SUBNET_1=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PublicSubnet1`].OutputValue' --output text)

export APP_SECURITY_GROUP=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`AppSecurityGroupId`].OutputValue' --output text)

export REPO_WEB=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryWebName`].OutputValue' --output text)

export REPO_BACK=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryBackName`].OutputValue' --output text)

export REPO_API=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryApiName`].OutputValue' --output text)

export DB_ADMIN_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseAdminSecretArn`].OutputValue' --output text)

export DB_ENGINE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseEngineName`].OutputValue' --output text)

export DB_ENDPOINT=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseEndpoint`].OutputValue' --output text)

export DB_NAME=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DbName`].OutputValue' --output text)

export CACHE_ENGINE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`CacheEngine`].OutputValue' --output text)

export CACHE_ENDPOINT=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`CacheEndpoint`].OutputValue' --output text)
```

{{% notice tip %}}
You can view the outputs for any CloudFormation stack in the [AWS Management Console](https://console.aws.amazon.com/cloudformation).
{{% /notice %}}

Select the stack on the left, and then click on the **Outputs** tab on the top right:

![verify](/images/app/cfn_out.png)



