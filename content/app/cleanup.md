---
title: "Cleanup"
date: 2018-08-07T12:37:34-07:00
weight: 14
---

If you want to keep your application running, you can do so, but this is the end of the workshop. In order to tear down the
Fargate cluster in a subsequent cleanup step, we need to delete the service.

```
ecs-cli compose --project-name $STACK_NAME --cluster-config $STACK_NAME service rm
```

{{% notice tip %}}
If the operation times out, run the command again.
{{% /notice %}}


