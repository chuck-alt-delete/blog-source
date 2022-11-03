---
title: "First Day at Materialize"
date: 2022-11-02T08:00:00-07:00
draft: true
---

Every so often, I decide to turn my life upside down. About a week ago, I made this announcement:

<div align="center">{{< tweet user="MrLarrieu" id="1584594310585991168" >}}</div>

But why? Why leave a great company (which, by the way, just beat expectations for the [6th consecutive quarter](https://investors.confluent.io/news-releases/news-release-details/confluent-announces-third-quarter-2022-financial-results), despite the recession)?

Why leave a manager and team that I love working with?

There are two reasons:
* It's a great time for me to take risks
* It's a great time for me to expand my expertise by doing something new

## Taking Risks

I am quite confident in Confluent. I'm going to exercise and hold my vested shares. Confluent owns the data streams, ensuring its place as a key player in the real-time data space for the forseable future. This confidence in Confluent's future affords me the ability to take greater risk, even in current poor market conditions. I am buying another ticket in the "startup lottery".

I've had the privilege and support to take these kinds of risks several times in my life, like when I:
* Decided to become a high school math teacher ([my teaching site](http://mrlarrieu.weebly.com/) -- a trip down memory lane!)
* Quit teaching to write math curriculum (see the [free curriculum](https://curriculum.illustrativemathematics.org/), taught to millions of students in the US)
* Quit writing math curriculum to teach myself DevOps (see my [DevOps interview prep post]({{< ref "/posts/devops-interview.md" >}}))

And each time was a phase change in my life for the better. Through teaching, I became more kind and empathetic. Through writing curriculum, I became a more creative and clear communicator. Through my DevOps bootcamp, I learned resillience in the face of failure and how to align my technical skill with business value.

This next step is really no different. This risk not only has a potentially great financial upside, but also a virtually guaranteed upside in terms of the skills and experience I will gain.

## Doing Something New

When I write courses, I am often tempted to give one simple assignment:

> Here is a list of references. Now, write a course about this subject for someone else. Get feedback on your work from an expert and revise.

This is exactly how I've gained the technical skills I have now. I am nearly certain I learned more by **_creating_** each course than anyone who has taken that course has learned from me -- about Mathematics, the internals of distributed systems like Kubernetes and Apache® Kafka, programming, software architecture, data, all of it. This is because knowledge is generally not transferred from teacher to learner; rather, it is constructed by the learner (see [Constructivism](https://en.wikipedia.org/wiki/Constructivism_(philosophy_of_education))).

So far I have created labs, demos, and other technical content from the safety of the Ivory Tower. The next step in my professional journey is to create software systems alongside real customers in production (a.k.a use systems [in anger](https://english.stackexchange.com/questions/30939/is-used-in-anger-a-britishism-for-something)).

In addition to the technical challenge, I also look forward to the organizational challenge of helping to build a company from an early stage. My generalist nature and creativity lend themselves nicely to the unstructured atmosphere of an early startup. It's a fun and interesting challenge to build on ground that shifts beneath my feet.


## Materialize!

With all of that said, today is my first day at [Materialize](materialize.com)! I will be working directly with customers as a Field Engineer under the management of excellent engineer and speaker [Seth Wiesman](https://www.linkedin.com/in/sethwiesman). Seth was very convincing about the prospects of Materialize, and with my own research, I have grown very excited at the potential impact we will have on the database industry.

Materialize is a database. "Oh no, yet another database!" I hear you shout. Well, Materialize does something really cool, and does it really well. When you query most databases, they act like they've never been asked that question before. They recompute the entire answer every time you ask. This is the idea of **passive data**. With Materialize, you ask a query, and that query lives persistently, constantly staying up-to-date as new data arrives in real-time. This is the idea of **active data** or **data in motion**, and was in fact [the promise of ksqlDB](https://www.confluent.io/blog/how-real-time-materialized-views-work-with-ksqldb/). In the time since ksqlDB added the "DB" part, it has for various reasons retreated to becoming more of a transformation tool in data pipelines and less of a database. Materialize, an amazing technology for streaming data pipelines in its own right, overcomes the limitations of ksqlDB to proudly wear the label "streaming database".

### Why I'm Excited About the Tech

As for the technical details, here are a couple of things that get me really excited about Materialize:

* It's a database built on top of a **stream processing** engine called [Differential Dataflow](https://timelydataflow.github.io/differential-dataflow/), implemented in pure Rust.
** Unlike other stream processors like Flink and Kafka Streams, Differential Dataflow is designed specifically for the stream processing use case without borrowing from older technologies originally created for batch or transactional worklaods (see [Why not RocksDB for streaming storage?](https://materialize.com/blog/why-not-rocksdb/)). The design of Differential Dataflow along with its Rust implementation means incredible performance

### Why I'm Excited About the Business

The competitive landscape for databases is tough, so Materialize had better have a killer go-to-market strategy. And it does! Here are a couple of reasons I'm excited about the business execution strategy:

### Fun Threads Where I Learned a Lot About Materialize

<div align="center">{{< tweet user="MrLarrieu" id="1584594310585991168" >}}</div>

### Questions I'm Gonna Research