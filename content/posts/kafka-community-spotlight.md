---
title: "Kafka Community Spotlight"
date: 2026-06-09T13:44:27-07:00
draft: false
---

I was featured on Stanislav Kozlovski's Kafka Community Spotlight!
- https://topicpartition.io/kafka/community/chuck-larrieu-casias

I will copy the contents here for posterity.

---

## Personal
### Please tell us about yourself, and where you are from.

I’m Chuck 👋🏻 (in the middle)
![chuck](/images/8-Chuck-Larrieu-Casias.jpg)

Chuck Larrieu Casias
I’m originally from Sonoma, California. I’ve moved around different parts of the US, but I’ve settled in Oregon and I hope to stay here for a long time.

My first profession was as a high school mathematics teacher in Los Angeles. After that, I wrote math curriculum at Illustrative Mathematics.

Then I graduated from an intense technology fellowship to transition into the IT industry.

### How did you get into technology?
I’ve been in love with video games since I was 6 years old playing Final Fantasy 7. I don’t know if that counts, but the idea that you can simulate worlds inside of computers has always fascinated me.

Later on in college, I started to use programming to do simulations and mathematical modeling; simulate predator-prey biological systems, population models, linear optimizations with the simplex method, etc.

During my technology fellowship (called Insight Data Science at the time), I studied distributed systems with an emphasis on Kafka. I ended up getting hired at Confluent as an education engineer designing courses and automating hands-on lab environments.

### Have you studied at a university? Did your study help you with your current job?
I studied mathematics with a research focus at University of Nebraska Lincoln (Go Big Red!). I studied things like Lie Groups and Braids. I definitely think my mathematics background has helped me in terms of being able to think abstractly and think about how complex systems interact.

I got my master’s degree in secondary mathematics education from University of Southern California (fight on✌🏻!). My training and experience as a teacher has helped tremendously in terms of having empathy for the customers I work with and trying to help them achieve what they need to do.

### How do you spend your free time? What are your hobbies?
I still love video games, especially ones with big open worlds and cool magical powers.

I also love to walk and look at houses.

And of course I really enjoy watching movies and tv shows and discussing them with friends.

### What does your ideal weekend look like?
A good meal downtown followed by a walk in the park with my family. Then we go home and play video games and watch movies.

### A book you’d recommend to readers.
Designing Data Intensive Applications

Measurement (Lockhart)

### Best type of music, best song?
Obviously Disney music is the best type of music.

Best song is too hard, but lately I like Desperado by Johnny Cash.

### Favorite food? Best cuisine you’d recommend?
Being from California, I have to say Mexican food. I am a burrito snob.

### Favorite Movie?
This is an impossible question, but lately I like Life of Chuck because it’s thought provoking and they got Tom Hiddleston to play me.

### Favorite drinks? Non-alcoholic or alcoholic?
Non alcoholic — I love Olipop root beer

### Any sports you do (or watch)?
Basketball. Warriors.

### What’s the best, non-mainstream thing you’d recommend anyone visiting your country to see/do?
US is a big place, so while it seems mainstream to me, you should visit the Sonoma area and enjoy the wine and food.

### What is the best advice you ever got?
Play your life like Magic the Gathering or similar strategy game. There are different currencies (money, energy, time, knowledge, etc). There are different phases to the game where different currencies become more important. Early on, you should spend all your points to improve your capacity to create more points. Exponential function is very important to understand deeply.

### What is the best advice you would give someone?
Take lots of calculated risks and quit early if they don’t work out. Basically make use of expected value calculations often in the face of uncertainty

## Kafka
### How did you get into Kafka?
I originally learned about Kafka in 2018 as I studied for my fellowship. Kafka and Kubernetes were the most interesting distributed systems to me at that time. I was hired by the education team at Confluent, and from there I became an expert.

### What Version of Kafka did you start with?
Must have been 2.0?

### Kafka was your introduction to distributed systems. Do you think Kafka has a high entry barrier (both to learn and use)?
I think there are stages and Kafka gets more nuanced as you progress through the stages. Managed services have made it pretty straightforward to get started producing and consuming records and creating low latency, high throughput data pipes. You no longer need to be an infrastructure expert to get a lot out of Kafka to start.

But as you go deeper, it’s like a thick onion. Each layer reveals more nuances. There’s thinking in events rather than request / response. There’s stateful stream processing. There’s materialization / state management. There’s consistency considerations. There is schema management. Beyond the technical concepts, there are all the organizational challenges as you scale — data discovery, self service, handling sensitive data securely in a streaming context, permissions management, data quality validation.

If you had to teach Kafka fundamentals to a new engineer today, what would you focus on first?
It depends if they are a platform engineer providing Kafka as a service or an application developer looking to build an event-driven service.

For the application developer, I do think it’s important to learn about how partitioning works and how it affects scalability on the consume side. Designing your record key is one of the most important Kafka decisions you can make in a producer application.

### You’ve been very close (and continue to be) to the “field” of Kafka sales - i.e people who help others work with Kafka. Can you share some stories? There must be a lot that was learned.
I shouldn’t be surprised at this point, but it is interesting to see how Kafka installations grow out of control, even when the total throughput is low. Everyone says they run a tight ship, they have great automation, but when we look at basic topic statistics (partitions, throughput, consumers), you usually see more of a mess than you might have expected.

I was once on an escalated support call investigating why some UI action was slow. The cluster had 500k partitions (this was with zookeeper). So yeah, metadata stuff was timing out. And it turns out half of those partitions were actually empty because their topics were completely empty. No one had bothered to clean them up. Same story for consumer groups. 100k consumer groups with UUID group IDs. Something smells!

### What’s the most annoying thing in Kafka you can think of?
Librdkafka producers use a different hashing algorithm (consistent_random) than Java producers (murmur2 hash) which results in the same key being written to different partitions depending on the library you use. This is insane.

### How has Kafka changed over the years from your point of view, for better and for worse?
Kafka was designed in an era where distributed systems were built on disks and VMs. Because of this, it’s actually a really great way to learn distributed systems architecture. But over the years, the industry has moved towards containers and object storage. Kafka is adapting, especially on the storage front.

### Have your thoughts about Kafka changed with it over the years?
It kind of feels like the Kafka ecosystem has shied away from stream processing. Now it seems like the soup du jour is dumping the raw data from Kafka into Iceberg and transforming it afterwards. I think that’s a bit of a shame.

At the same time I know of so many 200 line Kafka Streams applications out there holding companies together and delivering a ton of value.

### When should one choose Kafka? When should one not choose it?
There’s still nothing that beats a consumer tailing a log and taking action “immediately” in response to an event. When I say “immediately” I mean that the action is automatically triggered, not necessarily that the latency is super low. Even if it takes 200ms on top of diskless Kafka, it’s the application flow that I find powerful.

### What’s your take on the Kafka ecosystem (Streams, Connect, etc.)?
I think Kafka Streams punches above its weight. It’s pretty neat what kind of utility you can get out of a couple hundred line microservice that’s deployed as a simple JVM app with no processing cluster.

Kafka Connect is one of these things where I wonder if AI might significantly affect the build vs buy equation. The APIs of the external systems are well known and the Kafka Connect framework is well established. Seems like the perfect place for more companies to decide to build custom connector plugins in-house.

### How do you find the Kafka community? Do you think it’s shrinking/growing?
I am not sure. I have the ultimate selection bias. Everyone I talk to is deep into production Kafka. From industry events like IBM’s acquisition of Kafka, it seems clear we are entering a new phase of Kafka as an established, mainstream enterprise tool rather than trendy, cutting-edge tech only used by Patagonia-vested San Francisco residents.

### If you had a magic wand and could instantly and frictionlessly contribute/fix one thing to Kafka, what would it be?
The Apache Kafka Consumer should support parallelism and concurrency out of the box like the Confluent Parallel Consumer. Slow consumers → overpartitioning → needless cost and infrastructure burden.

### What’s your favorite quality of Kafka and log-based messaging?
I hinted earlier, but I think the event driven model where different parts of the organization pass messages and other parts react “immediately” is very powerful. I always think about when Jay Kreps said that companies are becoming software instead of just using it. When business operations become automatic and immediate instead of waiting around or even requiring a meeting, it completely changes the game. Human intelligence can be reserved for strategic decisions and creative analysis.

### What’s your take on on-prem versus cloud (with relation to Kafka)?
I am happy that small teams don’t need a big up-front investment to get going in the cloud. I’m also happy that highly regulated enterprises have more mature tools to run Kafka securely on-prem. There is also a middle ground of self-managed Kafka in the cloud which is also getting more mature. Obviously I’m going to say that in any of these situations, Conduktor is going to be a really helpful value driver :-)

### What’s the biggest thing you learned most recently about Kafka that somebody reading this may not realize?
I always thought of Kafka cost primarily in terms of data ingress and egress, but recently my team has been digging into the data and it’s amazing what a huge percentage of the bill is due to the number of partitions. Sometimes more than 75%. Many successful Kafka users have relatively low throughput, but that didn’t seem to stop them from going wild with partitions.

It’s easy to see why in retrospect. Choosing the number of partitions is a one-way door. Once you set the partition number, it’s very difficult to undo that decision because it will change where your record keys get routed. So people overprovision. And that seems fine until it’s not.

## Business/Work
### What do you do at your current job as a Senior Solutions Architect at Conduktor?
I partner with some of our largest customers to help them scale, secure, share, and govern their real-time data using Conduktor technologies. These technologies consist of enterprise-grade UI, federated gitops framework, and Kafka protocol-aware proxy.

### What’s your take on Kafka proxies (and proxies in general)? How has it changed since joining Conduktor?
Kafka proxies are incredibly clever and powerful. So many Kafka installations have tortured networking setups because they don’t have a proxy that understands the Kafka protocol. Beyond networking, you can use it as an enforcement tool in front of Kafka, like a nightclub bouncer. Data quality validation, field level encryption / tokenization / masking, cluster virtualization, protecting the cluster from poorly configured clients, cluster switchover during disaster recovery, etc.

### When should one use a Kafka proxy?
when you need to solve a Kafka networking challenge (like sharing data with an external organization or integrating after a merger / acquisition)
when you need to encrypt data at rest before it leaves your trust boundary (eg to enable secure cloud migrations)
When you need to “delete” data in Kafka due to compliance requirements (so-called “crypto shredding”)
When you’d like to run simple stateless transformations without maintaining a stream processing application
When you’d like to flip a switch and have all clients move from one cluster to another without them knowing
Enforce data quality rules
Protect your cluster from poorly behaved clients
When you’d like isolated tenants without dedicated physical clusters (eg run all non-prod workloads on virtual clusters)
Just think of all the creative things you can do when you have a proxy in the middle that can manipulate the requests
### How do you address the “single point of failure” concern of proxies?
Is nginx a single point of failure? Any Kafka proxy worth its salt should be stateless, horizontally and vertically scalable. In the case of Conduktor, the Conduktor Gateway proxy actually uses the Kafka group membership protocol to do its internal service discovery and stores any state it needs in Kafka. This clever design means you can actually cluster together Gateway instances across regions.

### What do you think about the idea of a multi-protocol proxy? (e.g Kinesis/Kafka/etc. API in one)
It’s an interesting idea. I don’t personally have enough market research on whether folks would find this valuable. The one I’ve heard of is IBM MQ, but the issue there is you have to reverse engineer the proprietary protocol and your proxy could be broken at any time by an update.

### You had a stint at Materialize. Can you tell us about that product?
Materialize is a powerful streaming database that presents itself as much as possible as a Postgres database. Underneath, it uses an incremental compute engine called Differential Dataflow. What it means for the user is you connect with standard Postgres drivers to materialized views that always stay up-to-date.

You can think of it as basically the best possible Postgres read replica, except it can read from Postgres, Kafka, MySQL, SQL Server, etc.

The thing that makes it really stand out is the attention to strong consistency. It uses a concept of virtual timestamps to maintain serializability globally across the system even though the operators are doing work distributed across a cluster. Unlike most other stream processors, Materialize will not emit partial intermediate results. It will only emit results the system can guarantee are correct. At any given timestamp, the output correctly reflects the input. This sounds simple and what you might expect from any system, but it’s actually really hard to achieve.

There is a genre of similar technologies that do so-called Incremental View Maintenance (IVM). Technologies like Feldera and RisingWave are taking a similar approach. IMO these technologies are 10 years ahead of their time. I can imagine in 10-20 years, this kind of IVM will just be yet another implementation detail inside the database. Other databases can do similar view maintenance today, but they can’t do so on complex views that include joins or recursive queries. Essentially Differential Dataflow and DBSP incremental engines underneath are next gen.

### When to use IVM?
IVM works super well when you need a result up-to-date and you make the same query repeatedly. Any kind of operational use case where the query is known ahead of time. You create an index in Materialize to keep the result up-to-date as new input data comes in. Since the result is precomputed incrementally, the reads are essentially free. A few milliseconds of query latency, with ~1 second freshness. What’s also nice about Materialize here is it is happy to do partial materialization. You can precompute most of the result and put finishing touches at query time. The more work you do at query time will mean higher latency, but you aren’t trapped by the query you decide to materialize.

### How did working in the Postgres-adjacent space differ from your past experiences?
It was fun to work with engineers who usually ship data slowly and transform it with dbt in the batch warehouse. I would help them get the benefit of event stream processing while they get to keep their SQL and dbt workflows.

I’ve definitely joined team “Just Use Postgres” for most use cases.

### Any fun experiences you’d like to share from your career?
The fun experiences are all about getting to know different personalities in our community. I’ve made lifelong friends at these conferences and working with different colleagues. Many of them are now working at all kinds of different companies and it’s really cool to see how their careers evolve. And it’s great to reunite in person every so often.

One funny experience was when a former colleague of mine was working for a company that was not allowed in the conference and he kept finding ways to get in and schmooze :-D

## General/Parting
### What do you think about queues for Kafka?
Sure, why not? Goodbye to head of line blocking

### What do you think about schemas in Kafka?
Use them.

Maybe a bit more of a hot take: a schema is a property of a collection, not an individual record. The ways schemas work in the Kafka world feels really tacked-on. Schema-on-read is a regrettable remnant of the NoSQL era.

An underrated feature of Conduktor is that you can add schema validation without a schema registry as data transitions from lawless JSON to structured schema.

### What do you think about Diskless Topics?
Really awesome, but as long as you have diskless and traditional topics mixed, you lose the awesome advantage of stateless brokers. I think Kafka should move towards “broker pools” where you can earmark some brokers to serve diskless topics in a stateless way for easier autoscaling, and other brokers can still be traditional stateful brokers. Then you can support higher latency but low cost workloads alongside lower latency but higher cost workloads in the same cluster while still getting the operational advantages you see in entirely diskless products like Buf and Warpstream.

### What do you think about Kafka’s current state of “cloud nativeness”?
It’s getting there. Tons of credit to Warpstream for seeing the architecture gap with object storage and knocking it out of the park in execution. So many “near real time” use cases are perfectly happy with ~1 second freshness and how cool is it you can tap into that while maintaining data sovereignty.

### How do you see the future of Kafka usage and development, 5 years out?
I think there will be interesting new challengers, but Kafka usage in the enterprise is going to remain strong for the foreseeable future. As the underlying storage system becomes commoditized, the protocol and the governance become more important.

### What other tech besides messaging do you have interest in?
I am interested in data architecture systems generally. Lately I’ve been thinking about the interesting pendulum swing between centralized vs local. There’s so much we can do on our laptops. Local first is truly the gold standard to me, but at the same time, the local experience needs to be generalizable to “real” remote infrastructure.

In a similar vein, I do think the current centralized AI regime is not long for this world. The security implications alone hint to me that the future is local. Open models, local inference (or perhaps run by your company privately), LLMs are here to stay, but I saw the SaaS pendulum shift in the data processing world and I think the same will happen with AI. I think smartphone inference will go to Google, and coding inference will happen on Apple hardware with open models and Microsoft hardware with closed models. A lot of crazy stuff will harden in the middle. Stuff is changing too fast right now, that’s for sure.

### How do you use AI in your day-to-day most often? Any favorite tools?
I mostly use Claude Code. I always think about it in terms of how it can help me remove obstacles for my customers. Sometimes I need custom scripts, demos, documentation, support triage. Claude can see our codebase, so I can get accurate information and build what I need without making a giant project out of it.

Lately I added some markdown files to the Conduktor AI Skill that help to solve one of the biggest adoption challenges for our gitops product. Conduktor Federated Ownership is all about ownership…but platform teams often have no idea who owns what. They just “rubber stamp” approve ACL requests and topic creation requests. I made it so you can tell the AI skill “bootstrap Conduktor self service for me”. It will use the Conduktor CLI to scan their existing environment, create an opinionated scaffold repo, and then guide you through suggested ownership based on existing permissions and IdP information. It eliminates the excuses to get started. It seems to be gathering a lot more excitement and movement from my customers than previous attempts.

### Any Social Media channels of yours we should be aware of?
I’ve carved all social media out of my life except for LinkedIn.

I also have a portfolio site:

https://chuck-alt-delete.github.io

My wife came up with Chuck-Alt-Delete and it has to be the best personal brand I could possibly hope for.
