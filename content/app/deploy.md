---
title: "Deploy"
date: 2018-08-07T12:37:34-07:00
weight: 13
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

If your Cloud9 instance stops, you will need to run the following command to set the environment variables again:

```
export $(grep -v '^#' ~/environment/fargate-workshop-apps/.env | xargs)
```


{{% notice info %}}
If you want to release a new build, simply repeat the steps in [build](/app/build/) and run the ecs-cli compose service up command again. This will drain your existing containers and deploy the latest build.
{{% /notice %}}


{{% notice tip %}}
The ecs-cli supports the [Docker Compose](https://docs.docker.com/compose/) configuration file, so you could create a similar
compose file if you wanted to run the application locally.
{{% /notice %}}

Once this command completes, you can see the status of the tasks by issuing:

```
ecs-cli compose --project-name $STACK_NAME service ps --cluster-config $STACK_NAME
```

The output of the command should resemble:

![ecs-cli ps](/images/deploy/ecs-cli-ps.png)

In this example, you can see that you have three running containers, the web/nginx, api and back.

After your containers are running, you can view the sample application by looking up the ALB hostname:

```
export ALB_URL=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`ApplicationLoadBalancerUrl`].OutputValue' --output text)
echo "Open $ALB_URL in your browser"
```

{{% notice info %}}
It can take a few minutes for the ALB DNS hostname to propagated and the services registered.
{{% /notice %}}



