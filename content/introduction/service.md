---
title: "Service"
date: 2018-10-087T08:30:11-07:00
weight: 13
draft: false
---

To ensure that you always have your task running without managing it yourself, you can create a [service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html) based on the task that you defined and Fargate ensures that it stays running. A service is a special construct that says, 'at any given time, I want to make sure that N tasks using task definition X1 are running." If N = 1, it just means "make sure that this task is running, and restart it if needed!" And with N > 1, you’re basically scaling your application until you hit N, while also ensuring each task is running.

![Overview](/images/introduction/overview.png)
