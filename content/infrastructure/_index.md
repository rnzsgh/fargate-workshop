---
title: "Infrastructure"
chapter: true
weight: 31
---

# Overview

In this section, we are going to create the resources below via an [AWS CloudFormation](https://aws.amazon.com/cloudformation/) template. CloudFormation is tool that enables you to define your [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code) (IaC).

* [Amazon Virtual Private Cloud](https://aws.amazon.com/vpc/) (VPC) - software-defined network
* [AWS Fargate Cluster](https://aws.amazon.com/fargate/) - managed container orchestration framework
* [Application Load Balancer](https://aws.amazon.com/elasticloadbalancing/) (ALB) - managed load balancer
* [Amazon Relational Database Service](https://aws.amazon.com/rds/) (RDS) - managed PostgreSQL or MySQL
* [Amazon ElastiCache](https://aws.amazon.com/elasticache/) - managed Redis or Memcached
* [Amazon Elastic Container Registry](https://aws.amazon.com/ecr/) - managed Docker container registry

![microservices](/images/deploy/containers.png)
