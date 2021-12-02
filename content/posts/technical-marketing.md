---
title: "Technical Marketing at Confluent"
date: 2021-11-30T09:28:03-08:00
draft: false
# cover:
#     image: /images/technical-marketing/kafka-meme-1.jpg
#     thumbnail: /images/technical-marketing/kafka-meme-1.jpg
---

I'm *really* excited to share that on Monday, December 6, I'll be joining the technical marketing team at Confluent!

## Goodbye, Curriculum Development

I've had an amazing time learning and teaching **data in motion** as a curriculum developer in Confluent's Education organization. I put a lot of energy into building curriculum development almost from the ground up, and it's amazing to see the seeds I've planted grow into formidable saplings.

Reflecting on my time in curriculum development, here are a couple of things I'm proud of:

* Built tooling and processes that dramatically increased developer productivity
* Created an automated virtual machine image pipeline with Ansible and Packer so that we could create any lab environment at will
* Supported and helped develop the Confluent Lab Portal, which allows customers to launch VMs in one click from the AMIs created by the image pipeline
* Became a subject matter expert in event streaming, security, and various Confluent products
* Overhauled several instructor led courses
* Created an [awesome introductory course about Confluent Platform](https://training.confluent.io/learningpath/install-confluent-platform)
* Created an [awesome course for ksqlDB](https://training.confluent.io/learningpath/create-an-event-streaming-app-with-ksqldb-using-confluent-platform)
* Created an [awesome Role Based Access Control course](https://training.confluent.io/learningpath/manage-access-to-confluent-platform-with-role-based-access-control)
  * This is probably where I learned the most. It's about Confluent RBAC, but it also faithfully follows all security best practices. I had to dive deep into security of every component in the system. It felt like I was a security consultant for a startup. The lab environment for this course ended up being reused for half a dozen other security courses.
* Created a simple but [super important course about Kafka listeners](https://training.confluent.io/learningpath/configure-broker-listeners-to-separate-cluster-traffic)
* Created an [awesome course about Confluent for Kubernetes](https://training.confluent.io/packagedetail/automate-deployment-with-confluent-for-kubernetes) (FREE!)
* Created an [awesome course about Ansible Playbooks for Confluent Platform](https://training.confluent.io/learningpath/automate-confluent-deployment-with-ansible)
* Pioneered the use of [Gitpod](https://gitpod.io) at Confluent to create 1-click, hands-on experiences
  * For example, run [Confluent Platform Demo](https://docs.confluent.io/platform/current/tutorials/cp-demo/docs/on-prem.html#gitpod) in Gitpod
* Learned a lot about the observability space and created a pretty sweet lab dedicated to Kafka client observability
  * Check it out -- https://github.com/chuck-confluent/kafka-observability (and you can run it yourself in the browser with Gitpod!)

I want to thank the entire Confluent Educaton team for their support. In particular, I give special thanks to my colleagues Gabriel Schenker, Russ Sayers, and Dave Shook, from whom I've learned so much, and to my manager Shira Gotshalk, who has been an amazing advocate for the team and set us in a great direction.

I can't share anything yet, but the Education team is working on some projects that will make reverberations throughout Confluent. It's sad to leave before these projects come to light, but I'm happy to have been a part of them, and I will cheer when they release!

While I enjoyed my work in curriculum development, it was was time to move closer to the challenges that exist out in the market. I want to convince folks to dramatically improve their data infrastructure by setting their data in motion with Confluent products. Once I get them in the door, my friends in Professional Services and Education will make sure they succeed.


## What is Technical Marketing?

I never ever ever thought I would be in marketing. Images conjure in my mind of Mad Men smoking cigars, thinking about ways to convince people to buy things they don't need, or of pop-up ads filling the screen when I'm away from my beloved AdBlock and PiHole.

It turns out that when you work at a company with really cool products that are actually transforming the way data is handled in the world, marketing is pretty fun!

I'm new to this, but from what I understand, technical marketing is about convincing folks to buy your product not just by telling them how it will improve their lives but by actually showing them with deep, fully fleshed-out working models. To be convincing to a technical audience, we not only have to communicate effectively, but we also need our stuff to work and work well.

## Technical Marketing at Confluent

<!-- ![meme](/images/technical-marketing/kafka-meme-1.jpg) -->

Confluent has an amazing Developer Experience (DevX) team that does something very similar to technical marketing. Our developer advocates also create demos, code examples, videos, blog posts, and presentations. The difference is in emphasis. Developer Experience is not primarily about selling products. It's about fostering community and making it easier for developers to learn and participate, with the hope that happy developers will someday translate to happy customers.

As a Technical Marketing Manager, I am ALL business. Where DevX focuses on making it fun and easy for developers to build event streaming apps, the technical marketing team convinces executives and technical leaders to invest in next-generation data infrastructure. We do this by creating specific examples of how Confluent products solve business problems. Here are a couple of really high quality examples from the technical marketing team:

* [Blog: Accelerate Your Cloud Data Warehouse Migration and Modernization with Confluent](https://www.confluent.io/blog/simplify-cloud-data-warehouse-migrations-with-confluent-data-solutions/)
  * [video demo](https://youtu.be/KD5reXjosbs)
* [Blog: Messaging Modernization with Confluent](https://www.confluent.io/blog/modern-messaging-and-data-integration-with-confluent/)
  * [github repo](https://github.com/confluentinc/pmm/tree/master/messaging-modernization)


{{< note >}}
By the way, if you're like me, you might find the title "Technical Marketing Manager" to be confusing. I'm not a people manager. I manage technical marketing content.
{{< /note >}}


## Promoting Confluent

<!-- ![meme](/images/technical-marketing/kafka-meme-2.jpg) -->

The underlying technology is so good that our biggest competition is actually people running open source Apache Kafka themselves. That seems cheap at first, but I can assure you it is in fact very difficult to own and operate critical infrastructure like Kafka at enterprise scale. You end up hiring teams of expensive platform engineers to work full time on operations that don't directly add business value. At Confluent, we have the lion's share of Kafka expertise. We can run Kafka for you better and cheaper than you can run yourself, and we can support you better than anyone else can.

Beyond just being really good at operating Kafka clusters, Confluent has a bunch of products that are table stakes for enterprise use cases. I look forward to creating deep technical content to showcase these features and set data in motion around the world!