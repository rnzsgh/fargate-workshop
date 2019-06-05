---
title: "Environment"
date: 2018-08-07T12:37:34-07:00
weight: 10
---

Now that we have the base Fargate cluster and related resources deployed, we are going to pull the output from the
CloudFormation stack, so that we can configure the Fargate tasks and service. The commands below query the CloudFormation
output and add them to an **.env** file located in the same directory as the Docker Compose file.

```
export STACK_NAME=workshop
echo STACK_NAME=workshop >> ~/environment/fargate-workshop-apps/.env
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query 'Account')

echo ACCOUNT_ID=$ACCOUNT_ID >> ~/environment/fargate-workshop-apps/.env

export REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

echo REGION=$REGION >> ~/environment/fargate-workshop-apps/.env

echo CLUSTER_NAME=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`FargateClusterName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo TARGET_GROUP_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TargetGroupArn`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo VPC_ID=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`VpcId`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo TASK_EXEC_ROLE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TaskExecutionRoleArn`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo TASK_ROLE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`TaskRoleArn`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo LOG_GROUP=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`FargateLogGroupName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo SUBNET_0=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PublicSubnet0`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo SUBNET_1=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PublicSubnet1`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo APP_SECURITY_GROUP=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`AppSecurityGroupId`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo REPO_WEB=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryWebName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo REPO_BACK=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryBackName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo REPO_API=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`EcrDockerRepositoryApiName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo DB_ADMIN_ARN=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseAdminSecretArn`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo DB_ENGINE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseEngineName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo DB_ENDPOINT=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DatabaseEndpoint`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo DB_NAME=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`DbName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo CACHE_ENGINE=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`CacheEngineName`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env

echo CACHE_ENDPOINT=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`CacheEndpoint`].OutputValue' --output text) >> ~/environment/fargate-workshop-apps/.env
```

{{% notice tip %}}
You can view the outputs for any CloudFormation stack in the [AWS Management Console](https://console.aws.amazon.com/cloudformation).
{{% /notice %}}

Select the stack on the left, and then click on the **Outputs** tab on the top right:

![verify](/images/app/cfn_out.png)



