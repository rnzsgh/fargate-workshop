---
title: "Create an AWS account"
chapter: false
weight: 1
---

{{% notice warning %}}
Your account must have the ability to create new IAM roles and scope other IAM permissions. For new accounts,
this is not an issue. Primarily, for security reasons corporate/work accounts may have restrictions related
to IAM attached to an account.
{{% /notice %}}

1. If you don't already have an AWS account with Administrator access: [create
one now by clicking here](https://aws.amazon.com/getting-started/)

1. After you have created an AWS account, follow the steps below to create an IAM user with administrative access
to this account.
[Create a new IAM user to use for the workshop](https://console.aws.amazon.com/iam/home?#/users$new)

1. Enter the user details:
![Create User](/images/prerequisites/iam-1-create-user.png)

1. Attach the AdministratorAccess IAM Policy:
![Attach Policy](/images/prerequisites/iam-2-attach-policy.png)

1. Click to create the new user:
![Confirm User](/images/prerequisites/iam-3-create-user.png)

1. Take note of the login URL and save:
![Login URL](/images/prerequisites/iam-4-save-url.png)
