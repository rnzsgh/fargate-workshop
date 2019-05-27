---
title: "Launch"
date: 2018-09-18T17:40:09-05:00
weight: 30
---

Now we are going to create a new VPC, Fargate cluster, Application Load Balancer (ALB), Docker repostiory (ECR), ElastiCache and RDS deployments using a
CloudFormation template.


Click the "Launch" button below to begin.

| Launch template |  |  |
| ------ |:------:|:--------:|
| VPC + Fargate + ECR + RDS + ElastiCache + ALB |  {{% cf-launch "stack.cfn.yml" "workshop" %}} | {{% cf-download "stack.cfn.yml" %}}  |

You can use the defaults or change the items as you like. By default, this will create an [Amazon ElastiCache](https://aws.amazon.com/elasticache/) instance running Redis and an [Amazon Relational Database Service](https://aws.amazon.com/rds/) (RDS) instance running PostgreSQL.

{{% notice info %}}
If you select "prod" in the environment variable, the template will create a [Multi-AZ](https://aws.amazon.com/rds/details/multi-az/) RDS deployment and a two node ElastiCache cluster.
{{% /notice %}}

Change the options as you like for the workshop and then see the following image for instructions on submitting the form and beginning the stack creation process.

![options](/images/infrastructure/stack_options.png)

To create the stack, you need to click the checkbox and then the "Create stack" button.

![options](/images/infrastructure/submit.png)

Once you have started the stack creation process, it will take approximately eight minutes to complete. When your stack is created,
you will see a status of "CREATE_COMPLETE" as shown in the image below.

![options](/images/infrastructure/stack_complete.png)





