---
title: "First Day at Materialize"
date: 2022-11-07T08:00:00-07:00
draft: false
---

Every so often, I decide to turn my life upside down. A bit over a week ago, I made this announcement:

<div align="center">{{< tweet user="MrLarrieu" id="1584594310585991168" >}}</div>

But why leave a great company (which, by the way, just beat expectations for the [6th consecutive quarter](https://investors.confluent.io/news-releases/news-release-details/confluent-announces-third-quarter-2022-financial-results), despite the recession)?

Why leave a manager and team I love working with?

There are two main reasons:
* It's a great time for me to take risks
* It's a great time for me to expand my expertise by doing something new

## Taking Risks

I am quite confident in Confluent. I'm going to exercise and hold my vested shares. Confluent owns the data streams, ensuring its place as a key player in the real-time data space for the forseeable future. This confidence in Confluent's future affords me the ability to take greater risk, even in current poor market conditions. I am buying another ticket in the "startup lottery".

I've had the privilege and support to take these kinds of risks several times in my life, like when I:
* Decided to become a high school math teacher ([my teaching site](http://mrlarrieu.weebly.com/) -- a trip down memory lane!)
* Quit teaching to write math curriculum (see the [free curriculum](https://curriculum.illustrativemathematics.org/), taught to millions of students in the US)
* Quit writing math curriculum to teach myself DevOps (see my [DevOps interview prep post]({{< ref "/posts/devops-interview.md" >}}))
* Quit writing technical curriculum to become a [Technical Marketing Manager]({{< ref "/posts/technical-marketing.md" >}})

And each time was a phase change in my life for the better. Through teaching, I became more kind and empathetic. Through writing curriculum, I became a more creative and clear communicator. Through my DevOps bootcamp, I learned resilience in the face of failure and how to align my technical skill with business value. Through technical marketing, I learned to listen closely to the user and speak to their needs.

This new role will have much to teach me as well. To be honest, I am a little intimidated; but I am also comforted by my history of taking on challenges like this.

## Doing Something New

When I write courses, I am often tempted to give one simple assignment:

> Here is a list of references. Now, write a course about this subject for someone else. Get feedback on your work from an expert and revise.

This is exactly how I've gained the technical skills I have now. I am nearly certain I learned more by **_creating_** each course than anyone who has taken that course has learned from me -- about Mathematics, the internals of distributed systems like Kubernetes and Apache® Kafka, programming, software architecture, data, all of it. This is because knowledge is generally not transferred from teacher to learner; rather, it is constructed by the learner (see [Constructivism](https://en.wikipedia.org/wiki/Constructivism_(philosophy_of_education))).

So far I have created labs, demos, and other technical content from the safety of the Ivory Tower. "Production" for me has meant a live workshop, conference demo, or published article. The next step in my professional journey is to build mission-critical software systems alongside real customers in production.

In addition to the technical challenge, I also look forward to the organizational challenge of helping to build a company from an early stage. My generalist nature and creativity lend themselves nicely to the unstructured atmosphere of an early startup. It's a fun and interesting challenge to build on ground that shifts beneath my feet.


## Materialize!

With all of that said, today is my first day at [Materialize](materialize.com)! I will be working directly with customers as a Field Engineer under the management of excellent engineer and speaker [Seth Wiesman](https://www.linkedin.com/in/sethwiesman). Seth was very convincing about the prospects of Materialize, and with my own research, I have grown very excited at the potential impact we will have on the database industry.

Materialize is a database. "Oh no, yet another database!" I hear you shout. Well, Materialize does something really cool, and does it really well. When you query most databases, they act like they've never been asked that question before. They recompute the entire answer every time you ask. This is the idea of **passive data**. With Materialize, you ask a query, and that query lives persistently, constantly staying up-to-date as new data arrives in real-time (a.k.a. an incrementally updated materialized view). This is the idea of **active data** or **data in motion**, and was in fact [the promise of ksqlDB](https://www.confluent.io/blog/how-real-time-materialized-views-work-with-ksqldb/). In the time since ksqlDB added the "DB" part, it has for various reasons retreated towards more of a transformation tool for data pipelines and less of a database. Materialize, an amazing solution for streaming data pipelines in its own right, overcomes the limitations of ksqlDB and proudly wears the label "streaming database".

Some other databases also offer incrementally updated views, but the key breakthrough for Materialize is that it can maintain these views with:
* incredible performance
* full support of arbitrary SQL, including complex joins and aggregations
* strong consistency

### Why I'm Excited About the Tech

As for the technical details, here are a couple of things that get me really excited about Materialize:

* It's a database built on top of a **stream processing** engine called [Differential Dataflow](https://timelydataflow.github.io/differential-dataflow/), implemented in pure Rust for beastly performance.
  * Unlike other stream processors like Flink and Kafka Streams, Differential Dataflow is designed specifically for stream processing workloads without borrowing from technologies originally created for batch or transactional workloads (see [Why not RocksDB for streaming storage?](https://materialize.com/blog/why-not-rocksdb/)).
  * Single threaded performance is insane. I found a [preliminary benchmark](https://github.com/TimelyDataflow/differential-dataflow/tree/master/tpchlike) that shows single digit to 10,000x single threaded performance improvements over Postgres and Spark on the TCP-H standard benchmark queries
  * The dataflows can scale horizontally as well.
* It guarantees [strict serializability](https://fauna.com/blog/serializability-vs-strict-serializability-the-dirty-secret-of-database-isolation-levels)
  * Therefore with respect to the [CAP Theorem](https://en.wikipedia.org/wiki/CAP_theorem), Materialize is a CP database -- strongly consistent and partition tolerant. In theory, this comes at the expense of availability, but CP databases can maintain high enough availability to meet essentially any practical requirement (see my [favorite blog post](https://cloud.google.com/blog/products/databases/inside-cloud-spanner-and-the-cap-theorem) about this from Google Cloud Spanner)
  * This means Materialize can support mission-critical transactional use cases that eventually consistent databases and stream processors simply can't (e.g. financial)

### Why I'm Excited About the Business

The competitive landscape for databases is tough, so Materialize had better have a killer go-to-market strategy. And it does! Here are a couple of reasons I'm excited about the business execution strategy:

* Materialize is fully compatible with Postgres wire protocol, meaning teams can keep using the tools they already use (e.g. `psql`, language libraries, `dbt`, etc) -- frictionless adoption.
* Confluent CEO Jay Kreps argued that [businesses are becoming software](https://www.confluent.io/blog/every-company-is-becoming-software/), meaning that software is taking more responsibility for making automatic business decisions.
  * With Materialize, stream processing applications can use the same frontend -> web server -> database architecture as traditional request/response applications to realize the promise of real-time, event-driven microservices that Jay describes without having to learn or operate a particular stream processing framework or library.
* Materialize supports arbitrary queries from the SQL-92 standard, which means data teams don't have to learn a new flavor of SQL and don't even have to learn nuanced details about stream processing (e.g. Kafka topics, partitions, brokers, stream/table duality, co-partitioning, etc).
* Materialize integrates with Kafka, so it plugs right in to the most successful data streaming platform in the world.
* Materialize has first class change data capture (CDC) integration with Postgres, making it essentially the best Postgres read replica ever. It can effortlessly serve even the most complex joins and aggregations, always up to date.
  * This means teams can start with a Postgres monolith for simplicity and fast time to market, and then effortlessly add Materialize as they scale and move to real-time microservices and analytics.
  * Kafka will still continue to make sense as a central data streaming platform as more data needs to be shared amongst more systems, but it is no longer a hard prerequisite to build event-driven microservices.
  * Over time, other first-class CDC integrations can be added (e.g. MySQL), further reducing friction for adoption (right now, you would have to use MySQL -> Debezium CDC -> Kafka -> Materialize).
* Materialize has first class support for the universally beloved Data Build Tool `dbt`, giving it the potential to quickly turn existing ETL data pipelines into superior real-time data pipelines (see [docs example](https://materialize.com/docs/integrations/dbt/)).
* While it's not trivial to operate Materialize as a managed service, the company is hyper-specialized on building and operating only Materialize.
  * Competitors are finding themselves operating multiple complex distributed technologies, requiring several different, specialized infrastructure teams.
* Materialize's performance means it will effectively compete with other databases on cost, which bodes well in an economy with tightening IT budgets.

### Fun Threads Where I Learned a Lot About Materialize

<div align="center">{{< tweet user="MrLarrieu" id="1572738521366147072" >}}</div>

<div align="center">{{< tweet user="dunithd" id="1557626408234622976" >}}</div>

<div align="center">{{< tweet user="MrLarrieu" id="1580995193045536769" >}}</div>

### Questions I'm Curious to Research

* How does ingestion from Kafka work? Does it use `librdkafka` Rust client? Can it scale beyond input partitions like the [Confluent Parallel Consumer](https://github.com/confluentinc/parallel-consumer)? The demo on that page shows 500 records/s for the vanilla consumer -> 20,000 records/s for the parallel consumer. This is because the vanilla consumer processes records in a single thread while the parallel consumer processes records with multiple threads in parallel while allowing the user to choose ordering guarantee (slowest: partition based ordering, faster: key-based ordering, fastest: unordered).
* Does Materialize require co-partitioning of input topics like Kafka Streams and Flink so that a given key from input topics always lands in the same stream processing task?
* Given strong consistency, should folks avoid Materialize for use cases where lots of late-arriving data is expected (e.g. edge devices sending records under spotty network conditions)?
* What's the story for selling and supporting on-prem Materialize deployments? I suspect having local, strongly consistent, real-time materialized views at the edge or on-prem would make for some interesting use cases!
* How does Materialize perform outside of steady state stream processing workloads, like
  * Backfilling?
  * Bootstrapping?
  * Catch up?
  * Bursty?
  * See [this talk](https://speakerdeck.com/knaufk/when-streaming-needs-batch-flinks-journey-towards-a-unified-engine) from Immerok to see how Flink handles these things
* Materialize is great for reading the current state _right now_, but what about historical aggregations? Kafka Streams and ksqlDB have the concept of [time windows](https://docs.ksqldb.io/en/latest/concepts/time-and-windows-in-ksqldb-queries/) and maintains these windows in memory for a retention period (default 1 day). If I want to look at the aggregation of a column over, say, 1 hour time windows for the last month, does Materialize have a way to specify and maintain incrementally updated views of those windows, and do they also have a retention time? Would we aggregate over time buckets like this [docs example](https://materialize.com/docs/sql/patterns/temporal-filters/#bucketing)? Without window retention, how would the system not run out of memory as time progresses? Perhaps these sorts of historical use cases are where it pays to use Materialize in conjunction with Pinot/Druid, as in Dunith's pizza example?

## Conclusion

This is going to be fun! I can't wait to help folks solve cool problems with Materialize! If you liked this post, then consider following me on [Twitter](https://twitter.com/MrLarrieu) and [LinkedIn](https://www.linkedin.com/in/charles-larrieu-casias/), and consider sharing with the social media buttons below.