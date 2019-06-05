---
title: "Scale"
date: 2018-08-07T12:37:34-07:00
weight: 14
---

At this point, our cluster and service are up and running. Our application turned out to be incredibly popular
and we need to scale the number of containers we are running in the cluster.

We are going to going to use the ecs-cli to accomplish the scaling:


```
ecs-cli compose --project-name $STACK_NAME service scale 2 --cluster-config $STACK_NAME
```

If you run the **service ps** command again, you will see that we now have six containers running.

```
ecs-cli compose --project-name $STACK_NAME service ps --cluster-config $STACK_NAME
```

The output should not resemble:

![scale out](/images/app/scale-ecs-cli-ps.png)

You can see that we now have six containers running, two of each (web, api and back)

{{% notice tip %}}
The Amazon ECS section of the [AWS Management Console](https://console.aws.amazon.com/ecs/home) provides a lot of useful information about out cluster.
{{% /notice %}}


