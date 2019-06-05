---
title: "Config"
date: 2018-08-07T12:37:34-07:00
weight: 12
---

Before we deploy the application, we are going to discuss the Docker Compose constructs used by the ecs-cli.

First, we have the ~/environment/fargate-workshop-apps/docker-compose.yml file:

```
version: '3'
services:
  web:
    image: ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_WEB}:${TAG}
    ports:
      - 8443:8443
    logging:
      driver: awslogs
      options:
        awslogs-group: ${LOG_GROUP}
        awslogs-region: ${REGION}
        awslogs-stream-prefix: web
  api:
    image: ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_API}:${TAG}
    ports:
      - 8090:8090
    logging:
      driver: awslogs
      options:
        awslogs-group: ${LOG_GROUP}
        awslogs-region: ${REGION}
        awslogs-stream-prefix: api
    environment:
      CACHE_ENGINE: ${CACHE_ENGINE}
      CACHE_ENDPOINT: ${CACHE_ENDPOINT}
  back:
    image: ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPO_BACK}:${TAG}
    ports:
      - 7080:7080
    logging:
      driver: awslogs
      options:
        awslogs-group: ${LOG_GROUP}
        awslogs-region: ${REGION}
        awslogs-stream-prefix: back
    environment:
      DB_ENGINE: ${DB_ENGINE}
      DB_NAME: ${DB_NAME}
      DB_ENDPOINT: ${DB_ENDPOINT}
```

In this file, you may notice the variables stored using the ${ENVIRONMENT} construct. Docker Compose and the ecs-cli support environment
variable replacement. This is helpful so that we do not need to hard code values that may change in the file. Each Docker
Compose file is translated into a [task](/introduction/task). Tasks with multiple containers are deployed to the same compute,
so they can communicate with each other via [localhost](https://en.wikipedia.org/wiki/Localhost). In this example, you can see that
we are deploying three container images (web, api and back).

In addition to the docker-compose.yml file, the ecs-cli supports additional ECS Parameters, generally defined in the [ecs-params.yml](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cmd-ecs-cli-compose-ecsparams.html) file, which enables additional configuration options for Fargate. Below is the ~/environment/fargate-workshop-apps/ecs-params.yml file used in this workshop:

```
---
version: '1'
task_definition:
  ecs_network_mode: awsvpc
  task_role_arn: ${TASK_ROLE}
  task_execution_role: ${TASK_EXEC_ROLE}
  task_size:
    cpu_limit: 256
    mem_limit: 512
  services:
    web:
      essential: true
    api:
      essential: true
    back:
      essential: true
      secrets:
        - value_from: ${DB_ADMIN_ARN}
          name: DB_ADMIN
run_params:
  network_configuration:
    awsvpc_configuration:
      subnets:
        - ${SUBNET_0}
        - ${SUBNET_1}
      security_groups:
        - ${APP_SECURITY_GROUP}
      assign_public_ip: ENABLED
```

Like the Docker Compose file, the ECS Parameters file also supports ${ENVIRONMENT} variables. In addtion to task level
resource attributes, it supports container level attributes. In the file above, you can see that we are passing in a
value from [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) to the "back" container. This is helpful because passing standard
environment variables to Docker containers is insecure.


{{% notice info %}}
In this example, we configured 256 CPU units and 512 memory units. This equates to 1/4 of a vCPU (1024 is a whole) and 512MB of memory. 
See the [Fargate pricing](https://aws.amazon.com/fargate/pricing/) page for more information on the supported configurations.
{{% /notice %}}





