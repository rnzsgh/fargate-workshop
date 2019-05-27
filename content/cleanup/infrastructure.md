---
title: "Infrastructure"
date: 2018-08-07T12:37:34-07:00
weight: 10
---

First we are going to delete the [ECR Docker repositories](https://console.aws.amazon.com/ecr/home#/repositories). In the [AWS Management Console](https://console.aws.amazon.com/ecr/home#/repositories), select the repositories that begin with
**workshop-** and then click the "Delete" button. Repeat this for all three repositories.

![ECR Delete](/images/cleanup/ecr_delete.png)

Now, we are going to delete the CloudFormation stack created. Open CloudFormation the [AWS Management Console](https://console.aws.amazon.com/cloudformation).

Select the **workshop** stack and then click the **Delete** button:

![CloudFormation Delete](/images/cleanup/cloudformation_delete.png)


