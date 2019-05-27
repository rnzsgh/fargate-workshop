---
title: "Deploy"
date: 2018-08-07T12:37:34-07:00
weight: 12
---

Now that we have built and pushed our application Docker images to ECR, we are going to use the ecs-cli command to deploy
the application to the Fargate cluster.

First we are going to configure the ecs-cli to work with our cluster:

```
ecs-cli configure --region $REGION --cluster $CLUSTER_NAME --default-launch-type FARGATE --config-name $STACK_NAME
```

{{% notice info %}}
The ecs-cli stores the configuration data in ~/.ecs/config. Using this simply allows us to pass fewer arguments
when we use the tool.
{{% /notice %}}

In this section, we are going to deploy the application using the ecs-cli:

```
cd ~/environment/fargate-workshop-apps
ecs-cli compose --project-name $STACK_NAME service up \
  --target-group-arn $TARGET_GROUP_ARN \
  --container-name web \
  --container-port 8443 \
  --cluster-config $STACK_NAME \
  --vpc $VPC_ID
```

{{% notice tip %}}
The ecs-cli supports the [Docker Compose](https://docs.docker.com/compose/) configuration file, so you could create a similar
compose file if you wanted to run the application locally.
{{% /notice %}}


