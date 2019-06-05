---
title: "Service"
date: 2018-10-087T08:30:11-07:00
weight: 13
draft: false
---

Fargate allows you to run and maintain a specified number of instances of a task definition simultaneously in a cluster. This is called a [service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html). If any of your tasks should fail or stop for any reason, the Amazon ECS service scheduler launches another instance of your task definition to replace it and maintain the desired count of tasks in the service depending on the scheduling strategy used.

In addition to maintaining the desired count of tasks in your service, you can optionally run your service behind a load balancer. The load balancer distributes traffic across the tasks that are associated with the service.

![Overview](/images/introduction/overview.png)
