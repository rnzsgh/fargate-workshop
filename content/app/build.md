---
title: "Build"
date: 2018-08-07T12:37:34-07:00
weight: 11
---

In this step, we are going to build the Docker images for the application and push them to separate [Amazon Elastic Container Registry](https://aws.amazon.com/ecr/) (ECR) Docker repositories. The ECR repositories were created for you in the CloudFormation template, but if you would like more information, see the [ECR getting started guide](https://docs.aws.amazon.com/AmazonECR/latest/userguide/ECR_GetStarted.html).

##### Docker Login

ECR operates like a standard Docker repository, but also supports fine-grained access controls with [AWS Identity and Access Management](https://aws.amazon.com/iam/) (IAM). In this step, we are going to use an AWS CLI call to generate the Docker login command that contains a token that is valid for 12 hours. See the [aws ecr get-login](https://docs.aws.amazon.com/cli/latest/reference/ecr/get-login.html) docs for more information.

```
$(aws ecr get-login --no-include-email)
```

##### Web Docker Image

```
cd ~/environment/fargate-workshop-apps/web
docker build --tag $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_WEB:latest .
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_WEB:latest
```

##### API Docker Image

```
cd ~/environment/fargate-workshop-apps/api
docker build --tag $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_API:latest .
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_API:latest
```

##### API Back-end Image

```
cd ~/environment/fargate-workshop-apps/back
docker build --tag $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_BACK:latest .
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_BACK:latest
```

