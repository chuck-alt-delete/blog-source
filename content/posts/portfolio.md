---
title: "Portfolio"
date: 2021-07-23T18:54:05-07:00
draft: false
---

This page displays exemplars of my work.

{{< note >}}
Any of this content may have been modified or deleted since being recorded here.
{{< /note >}}

## Field Engineering Assets

As a Field Engineer at Materialize, I help folks find success using Materialize, a Postgres-compatible operational data warehouse that incrementally materializes and serves even the most complex joins and aggregations, always up-to-date. Here are a couple of assets to highlight:

- I wrote [When to Use Indexes and Materialized Views](https://materialize.com/blog/views-indexes/), which is the first and most highly emphasized resource we share with all new users. Sharing this post prevents a common scenario where users would query Materialize without indexes and leave with a bad impression about the product. This post has helped numerous customers find success with Materialize.
- I wrote the joins section of our [optimization documentation](https://materialize.com/docs/transform-data/optimization/#join), which is critical to minimizing cost for our customers.
- I wrote the [temporal filter documentation](https://materialize.com/docs/transform-data/patterns/temporal-filters/) to help customers learn how to continuously compute results over recent time windows, saving memory resources and boosting developer productivity.
- I documented the solution for a common pattern called a [rules execution engine](https://materialize.com/docs/transform-data/patterns/rules-engine/).
- I've contributed several GitHub repositories to demo Materialize or help customers with common needs.
  - [datagen CLI](https://github.com/chuck-alt-delete/datagen) -- This tool has been key to creating demos and helping a few prospects run authentic proof-of-concept workloads without needing to complete complex security reviews first.
  - [mz-auction-house](https://github.com/chuck-alt-delete/mz-auction-house) -- A full stack demo application to illustrate how to use Materialize as a real-time backend for complex alerting. I have since expanded this into one of our official demos, which unfortunately is in a private repository.
  - [mz-sqlalchemy-example](https://github.com/chuck-alt-delete/mz-sqlalchemy-example) -- A best practice template for integrating Materialize with SQL Alchemy, a Python ORM.
  - [dbtmz](https://github.com/chuck-alt-delete/dbtmz) -- A best practice template for integrating Materialize with `dbt`.
  - [fastapi_psycopg3_example
](https://github.com/chuck-alt-delete/fastapi_psycopg3_example) -- A best practice template for integrating Postgres (and, by protocol compatibility, Materialize) with Python FastAPI webserver framework.
  - [nodejs-subscription](https://github.com/MaterializeInc/demos/issues/91) -- A best practice example for creating a Node application backed by Materialize's real-time `SUBSCRIBE` functionality.

Outisde of these publicly available assets, I have several custom solutions I've built for specific customers as well as demos.

## Technical Marketing Assets

As a Technical Marketing Manager at Confluent, I create and review blogs, whitepapers, demos, and videos. Here are a couple of assets to highlight:

- SIEM Optimization
  - I heavily refactored a SIEM Optimization demo created by our enterprise sales engineers
  - I added self-paced learning modules and executive brief documentation
  - I added 0-setup, 1-click deployment with Gitpod ([click here](https://gitpod.io/#https://github.com/confluentinc/demo-siem-optimization) to run demo in your browser) 
  - [Demo Repo](https://github.com/confluentinc/demo-siem-optimization)

- Confluent Platform Demo
  - I took ownership of our flagship showcase demo and am sole maintainer (as of writing)
  - I refactored the demo to use Confluent Cluster Linking instead of Confluent Replicator and added Schema Linking
  - GitHub Repo: https://github.com/confluentinc/cp-demo

- 10x Storage (10x Campaign)
  - [Video conversation](https://www.confluent.io/en-gb/resources/online-talk/10x-apache-kafka-storage/)
  - [Demo repo: Training Machine Learning Models using Confluent Infinite Storage](https://github.com/confluentinc/demo-10x-storage)

- Trust Confluent Campaign
  - [Demo repo](https://github.com/confluentinc/demo-trust)
  - [Video](https://www.confluent.io/resources/online-talk/trusted-data-streaming-with-confluent-cloud/)

## Courses 

As a Senior Curriculum Developer at [Confluent](https://www.confluent.io), I have written many courses related distributed systems, databases, and stream processing. I'll highlight two courses here. Sign up for the [free self-paced courses](https://training.confluent.io/packagedetail/confluent-education-free-self-paced) and then check out:

### Automate Deployment with Confluent for Kubernetes
- [Whole course is free](https://training.confluent.io/learningpath/automate-deployment-with-confluent-for-kubernetes), including fully managed hands-on labs
- Labs are available on GitHub at [https://github.com/confluentinc/confluent-kubernetes-examples](https://github.com/confluentinc/confluent-kubernetes-examples)
- In particular, I contributed heavily to:
  - [Configure external access with host-based routing](https://github.com/confluentinc/confluent-kubernetes-examples/tree/master/networking/external-access-static-host-based)
  - [Production grade security](https://github.com/confluentinc/confluent-kubernetes-examples/tree/master/security/production-secure-deploy)
- See my [merged pull requests](https://github.com/confluentinc/operator-earlyaccess/pulls?q=is%3Apr+is%3Aclosed+author%3Achuck-confluent) for details
### Create an Event Streaming App with ksqlDB
- [Whole course is free](https://training.confluent.io/learningpath/create-an-event-streaming-app-with-ksqldb-using-confluent-platform), including fully managed hands-on labs

## GitHub Profiles

- https://github.com/chuck-alt-delete
- https://github.com/chuck-confluent

## Coding Puzzles

While I enjoy solving coding puzzles for fun, I have significant anxiety when doing these coding challenges in interview conditions under time pressure, and as a dad with young kids and a full time job, I can't grind these out in my free time anymore like I used to in order to prepare for new interviews. I may therefore opt out of such interview questions and direct interviewers to this section of my portfolio instead.

Here are some links to dozens of data structure and algorithm style coding puzzles that I've done. I mostly like to do them in Python, but I'm conversant in Java, Go, and Javascript as well. Ask me to explain any of the solutions and I'll happily get into recursion, depth first search, breadth first search, topological sort, quicksort, mergesort, dynamic programming, regular expressions, hashmaps, arrays, trees, generators, minheaps, queues, stacks, functional programming, object oriented programming, whatever other nerdy things you'd like to talk about.

- https://github.com/chuckinator0/Projects/tree/master/scripts
- https://github.com/chuck-alt-delete/exercism/tree/main/python