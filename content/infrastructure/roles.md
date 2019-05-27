---
title: "Roles"
date: 2018-09-18T17:40:09-05:00
weight: 29
---

Before we launch the CloudFormation template, we are going to ensure that we have the proper
[AWS Identity and Access Management](https://aws.amazon.com/iam/) (IAM) roles in place.

Copy/Paste the following commands into your Cloud9 workspace:

```
aws iam get-role --role-name "AWSServiceRoleForElasticLoadBalancing" || aws iam create-service-linked-role --aws-service-name "elasticloadbalancing.amazonaws.com"

aws iam get-role --role-name "AWSServiceRoleForECS" || aws iam create-service-linked-role --aws-service-name "ecs.amazonaws.com"
```

{{% notice info %}}
The IAM roles that we are create in this step are [service-linked roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html). A service-linked roles is a unique type of IAM role used by the service and include all the permissions that the service requires to call other AWS services on your behalf.
{{% /notice %}}
