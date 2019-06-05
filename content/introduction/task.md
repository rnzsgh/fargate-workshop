---
title: "Task"
date: 2018-10-087T08:30:11-07:00
weight: 12
draft: false
---

When you want to run a container in Fargate, you must define a task. Tasks are a logical grouping of 1 to 10 containers that run together in the same compute space, generally in a tightly coupled manor. Let’s say that you want to run a custom blog engine, you might put together a web server, application server, and an in-memory cache, each in their own container. Together, they form a basic frontend unit.

The details of a task are contained in the [task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html) which is created in the [AWS Management Console](https://aws.amazon.com/console/) or [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).

At a high-level, task definitions in Fargate include the following details:

* The Docker image(s) to use with each container in your task
* How much CPU and memory to use with each task or each container within a task
* Whether the task should continue to run if the container finishes or fails
* The command the container should run when it is started
* The IAM role that your tasks should use

{{% notice tip %}}
The [Example Task Definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/example_task_definitions.html) docs are helpful
{{% /notice %}}
