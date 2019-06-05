---
title: "Cluster"
date: 2018-10-087T08:30:11-07:00
weight: 11
draft: false
---

A [cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_clusters.html) is a grouping of containerized tasks in Fargate that exist within a single [AWS Region](https://aws.amazon.com/about-aws/global-infrastructure/), but can span multiple [Availability Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html). In Fargate, a cluster can be thought of as simply a namespace that also manages the underlying compute and container orchestration.

{{% notice tip %}}
Creating separate clusters for your environments is a general best practice (e.g., dev, stage, prod). The Fargate control plane/cluster is free, you only pay for the compute.
{{% /notice %}}
