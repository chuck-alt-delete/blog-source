---
title: "What is an API?"
date: 2022-12-11T14:32:21-08:00
draft: False
---

{{< tip >}}
I originally wrote this for https://confluent.io/learn/api, but I wanted to host a version of it on my own blog.
{{< /tip >}}

## Introduction

API stands for **Application Programming Interface**, which allows applications to communicate with one another. In the following image, imagine an app on the left is trying to communicate with the app on the right:

![](/images/what-is-an-api/api-image.png)

The key idea is the app on the left doesn’t need to know the details about how the other application works; it only needs to know about how to use the API. This is the concept of **abstraction**, which makes it possible for new programs to build on top of the hard work encoded into other programs.

There are many kinds of APIs and a mountain of technical definitions. This post will discuss only a few modern APIs in plain language with practical examples and some hands-on components.

## Metaphor: Video Games

Video games make a nice metaphor for the power of abstraction that an interface provides.

<p align="center">
<img src="/images/what-is-an-api/api-image-controller.jpg"/> 
</p>

The video game player presses buttons, and somehow the video game console knows how to take those buttons and turn them into actions in the game. The player only needs to know the buttons to press in order to have fun with the game; they do not need to know how the machine takes those inputs and uses them to render actions on the screen.

## REST API

The REST API is the most popular API architecture in modern web applications. REST stands for **Representational State Transfer**. The underlying theory is nuanced, but in practice a REST API basically means there is a client who makes certain kinds of requests to alter resources on a server. Each request represents the state the client wants the resource to have and attempts to transfer that wish to the server. The server responds on its own without having to remember anything about the client (this is known as stateless requests).

<p align="center">
<img src="/images/what-is-an-api/api3.jpg"/> 
</p>

The most common place you will see REST APIs at play is in your browser. You click a button, and the browser will send a request to a server to retrieve a resource and display that resource on your screen.

REST APIs are sometimes described as”RESTful”.

### Example: cURL a Web API

It’s difficult to conceptualize a REST API without a concrete example. Suppose there is a RESTful book API service hosted at https://api.fakebooksite.com. Users can create, read, update, and delete books using the API.

The cURL command is an application that can create HTTP requests and is commonly used to interact with REST APIs from the command line. Here is an example of a request one might submit to the books REST API server with the cURL application:

```bash
curl --request GET \
    "https://api.fakebooksite.com/v1/authors?author=chuck&sort=title:desc"
```

Here, the `curl` command uses the “GET” HTTP method, so this command should retrieve a resource from the server rather than creating or updating a resource on the server. Let's break down what the different parts of the URL ("uniform resource locator") are doing in this API.

url part | purpose
|---------|---------
`https://` | This is the part of the URL that signals what **protocol** will be used. In this case, we use the secure HTTP protocol.
`api.fakebooksite.com` | This part of the URL is called the **domain**. This is what humans use to find servers on the internet (as opposed to IP addresses).
`/v1/authors/` | This part of the URL is the REST API **endpoint**. It points to resources on the server. It is often prefixed by an API version so that the API can evolve over time without upsetting those who prefer to use older versions. This endpoint points to the “authors” resource. 
`?author=chuck&sort=title:desc` | This part of the URL is called the **query string** which starts with a “?” and encodes **query parameters**, which are key-value pairs defined with an “=” and separated with “&”. In this case, we specify the name of the author and ask for the response to be sorted by title name in descending (reverse) alphabetical order.

The REST API server application would be written in a way to respond to this kind of request and serve a response. In this case, the books API might retrieve information about books written by “chuck” from a database, perform a sort operation, and send a response to the cURL client in a JSON format.



{{<tip>}}
APIs often respond with data encoded in JSON format. The `jq` command is a handy tool for parsing json responses. It is useful to pipe the results of a curl command into `jq` to see a pretty output, like this (`-X` is a shortcut for `--request`):
```bash
curl -X GET https://my-cool-site.com/v1/cool-quotes | jq
```

```json
{
	"quotes": [{
			"author": "Bill and Ted",
			"quote": "Be excellent to each other"
		},
		{
			"author": "George Box",
			"quote": "All models are wrong. Some are useful."
		}
	]
}
```
{{</tip>}}

JSON stands for **JavaScript Object Notation**. Despite its name, it is simply a standard file format that any language can use to send and receive data over the internet. The next example will send JSON data to a REST API endpoint.

It’s great to receive data from a REST API endpoint, but often we also want to send a “payload” of data to a REST API. Here is an example that creates/updates the book “Chuck’s Cool Book”:

```bash
curl \
    --request PUT \
    --header “Content-Type: application/json” \
    --user chuck:chuck-password \
    --data ‘{
        “author”: “chuck”,
        “title”:”Chuck’s Cool Book”,
        “text”: “When I was a boy, I ate 3 dozen eggs each morning…” }’ \    
    "https://api.fakebooksite.com/v1/books" 
```

There are a couple of new things here to notice:

part | description
|---------|---------
`--request PUT` |We are using a different HTTP method. “PUT” usually means we want to provide data the server can use to create a resource or replace a resource if it already exists.
`--header “Content-Type: application/json”`|Headers are key-value pairs that give the server or client additional information about the request. There are many standard headers, like “Content-Type”. In this case, the client is telling the server that it is going to send a JSON data payload.
`--user chuck:chuck-password`| cURL’s --user option creates an “Authorization” header that includes username and password so the server can authenticate the client and decide if it is authorized to have its request fulfilled. In this case, it’s probably a good idea to require users to sign in before they are allowed to post books, otherwise anyone could stuff the database full of whatever books they want. It’s also important that the protocol for this API is HTTPS rather than just HTTP. HTTPS means the connection between the client and server is encrypted, so no one can eavesdrop on the connection and steal the user’s password.
`-data ‘{...}’`|We use this option to compose our JSON payload to send to the server. In this case, we define author, title, and book text in JSON format to send to the server.

In summary, the above cURL command will send an HTTP PUT request to the server at the /v1/books endpoint with a JSON payload. When the server receives the PUT request, it would authenticate the user, check whether the user is authorized to create that resource, perhaps update a database record for that book, and then return a response to the client (e.g. status code 200 to report success).

{{<note>}}
The server might behave very differently depending on which HTTP method is used. In this case, a GET request to https://api.fakebooksite.com/v1/books?author=chuck&title=Chuck%27s+Cool+Book might not require authentication at all and give a response that includes the contents of “Chuck’s Cool Book” in JSON format.
{{</note>}}

## GraphQL API

GraphQL is an API query language that provides an alternative to REST. GraphQL is great because it gives clients a more flexible way to query an API for exactly what they need and provides developers an easier way to evolve their APIs while maintaining backward compatibility.

GraphQL specifies three execution operations:

- Query (retrieve data from the server)
- Mutation (change data on the server)
- Subscription (subscribe to a stream of data events from the server)

### GraphQL Example: Querying Countries

Go to https://lucasconstantino.github.io/graphiql-online/ to play hands-on with a graphQL API.

Here is an example query that you can input into the GraphQL playground:

```graphql
query {
  countries(filter: { code: { regex: ".*A.*" } }) {
    currency
    code
    name
    continent {
      name
    }
  }
  languages(filter: { code: { regex: ".*r" } }) {
    native
    name
    code
  }
}
```

This example illustrates how GraphQL gives the client the power to decide what data they want the server to return. With a REST API, making a GET request to a `/countries` endpoint would return a lot of information the client doesn’t necessarily need, and it would be up to the client to parse through the response. In addition, GraphQL empowers the client to choose data they want from a variety of resources in a single request. In this example, we also see that the client has requested information about languages. With a RESTful architecture, the client would have to make two requests, one to `/countries` and another to `/languages`.

Here are a few things to notice about the query:

- The query is defined with the “query” keyword within curly braces {}
- A filter can be applied so that only a subset of data is returned to the client E.g. for `(filter:{code:{regex:".*A.*"}})`, we select only the countries whose country code contains an “A” using regular expressions.

The GraphQL web editor, called GraphiQL, is sending an HTTP request to a real GraphQL endpoint. Here’s what an equivalent cURL command looks like (note the escape backslashes for double quotes and the lack of newlines in the query value):

```bash
curl -s -X POST -H "Content-Type: application/json" \
    --data '{"query":"{  countries(filter: {code: {regex: \".*A.*\"}}) {    currency    code    name    continent { name }  }  languages(filter: {code: {regex: \".*r\"}}) {    native    name    code  }}"}' \
    https://countries.trevorblades.com | jq
```

Next, explore the API on your own. It’s especially helpful to use `Ctrl+Space` to take advantage of auto-complete. Also don’t forget to explore the docs panel on the upper right. These docs are automatically generated from GraphQL’s type system (yay schemas and auto generated documentation!).

## RPC API

Another popular alternative to REST API architecture is RPC, which stands for **Remote Procedure Call**. With an RPC API, the client sends a request to a server that asks the server to execute a “procedure” (i.e. “function”, or “method”).

RPC is different from a REST because the endpoint in a REST API is a resource like `/v1/books/`, whereas the endpoint in an RPC API is an action like `/v1/book.update`. In other words, REST APIs are centered around **nouns** whereas RPC APIs are centered around **verbs**.

RPC APIs are popular for synchronous communication between microservices. The most popular framework for developing RPC APIs is [gRPC](https://grpc.io/).

### RPC API Example: Fictional Store API

This example by Arnaud Lauret is useful to illustrate the difference between REST and RPC APIs:

Operation | RPC (operation) | REST (resource)
|---|---|---
Signup 	|POST /signup	|POST /persons
Resign 	|POST /resign 	|DELETE /persons/1234
Read person 	|GET /readPerson?personid=1234 	|GET /persons/1234
Read person's items list 	|GET /readUsersItemsList?userid=1234 	|GET /persons/1234/items
Add item to person's list 	|POST /addItemToUsersItemsList 	|POST /persons/1234/items
Update item 	|POST /modifyItem 	|PUT /items/456
Delete item 	|POST /removeItem?itemId=456 	|DELETE /items/456

Source: https://apihandyman.io/do-you-really-know-why-you-prefer-rest-over-rpc/#examples

Notice RPC APIs only use POST and GET HTTP methods, choosing to let the endpoint describe what kind of operation is taking place. Compare that to REST, where DELETE, GET, POST, and PUT methods to the same resource endpoint will result in different behaviors.

### RPC API Example: Slack API

Slack is a popular enterprise collaboration app. Slack offers an RPC API to interact with its resources. Here is an example for setting a user’s profile data:

```bash
# Set user profile data
curl -X POST \
-H “Content-Type: application/json” -H “Authorization: Bearer my-super-secret-token” \
--data ‘{
	"profile": {

		"status_text": "riding a train",
		"status_emoji": ":mountain_railway:",
		"status_expiration": 1532627506,
		"first_name": "John",
		"last_name": "Smith",
		"email": "john@smith.com",
		"fields": {

			"Xf06054BBB": {
				"value": "Barista",
				"alt": "I make the coffee & the tea!"
			}
		}
	}
    }’ https://slack.com/api/users.profile.set?user=W1234567890 | jq
```

The JSON data payload is taken straight from the example in Slack’s documentation. Notice the endpoint /api/users.profile.set is an action rather than a resource. Here just a few other action-oriented RPC endpoints related to users:
- users.profile.get
- users.deletePhoto
- users.setPhoto
- users.setActive

Slack API documentation pages for their endpoints (called “methods”, which makes sense for RPC):
- https://api.slack.com/methods


## Native Library API

All the API examples so far have been APIs over the HTTP protocol (REST, GraphQL, RPC), but another common way to use APIs is directly in the code of your own application through **libraries**.

<p align="center">
<img src="/images/what-is-an-api/api-image-4.png"/>
</p>

A **library** is a collection of objects and functions that you can import into your own application to use. A library is typically tailored to solve a specific problem. Instead of solving that problem yourself, you take advantage of the library’s capabilities by using its API. This makes more sense as you dig into examples.

### Library API Example: Python's JSON Library

Here is a simple Python program that uses the API provided by the json library to serialize a Python dictionary into a json file.

```python
import json

my_dictionary = { "my-key" : [1,2,3] }
with open("my-file.json", "w") as f:
    json.dump(my_dictionary, f)
```

Here are a few things to notice:

`import json`
- This is where we import the library. Every language provides ways to import libraries.

`json.dump(my_dictionary, f)`
- We can research the library’s official [API documentation](https://docs.python.org/3/library/json.html) to find the functions and objects we need for our program.
- In this case, we find that the dump method does what we want — it takes a Python object and serializes it into JSON file format.
- The API specifies that dump has two required positional arguments — first, the object to be serialized, and second, a file writer object to write the JSON data to a file.
- The important point is that we can use the dump function in our program without knowing at all how it is implemented.


### Library API Example: Apache Kafka Producer API

Apache Kafka provides APIs to read from, process, and write data to Kafka servers (called brokers). There are [Kafka client libraries](https://developer.confluent.io/kafka-languages-and-tools/) available in many programming languages. We’ll use Java to contrast with the previous Python example.

```
…
import org.apache.kafka.clients.producer.*;
…

public class ProducerExample {

public static void main(final String[] args) throws IOException {
…
final Properties props = new Properties();
InputStream propsFile = new 
FileInputStream("src/main/resources/producer.properties");
props.load(propsFile);

KafkaProducer<String, String> producer = new KafkaProducer<>(props);
String t = "my_topic"
String k = "mykey";
String v = "myvalue";
ProducerRecord<String, String> record = new ProducerRecord<String, String>(t, k, v);
producer.send(record);
}
```

The pattern is the same as the previous example:

- import the library
- research the API documentation to learn what objects and functions are available and how to use them
- Profit

In this case, we

- create a `KafkaProducer` object called “producer” configured with a properties file
- Define a topic, key, and value
- Create a `ProducerRecord` object called “record” that holds the record key, record value, and the topic where we want to send the record


## Best API Tools

Here are some of the most popular tools for developing and using APIs:

### Awesome Docs
- https://developer.mozilla.org/en-US/docs/Web/HTTP -- Excellent reference for all things HTTP, like headers, methods, status codes, etc.
- https://graphql.org/learn/
- https://grpc.io/docs/

### Search hubs for APIs others have made
- https://app.swaggerhub.com/search by SmartBear
- https://www.postman.com/explore by Postman

### Tools to interact with APIs
- https://swagger.io -- Interactive online API editor demo that models a pet store REST API with Open API: https://editor.swagger.io/
- https://postman.com
- https://insomnia.rest/ – API development tool by Kong, Inc.
- https://httpie.io/ -- httpie is a really great, modern alternative to cURL
  - https://httpie.io/docs/cli/examples – examples that you can run interactively on https://httpie.io/cli/run

### Popular frameworks for developing web APIs:
#### Python
- FastAPI https://fastapi.tiangolo.com/
- Flask https://flask.palletsprojects.com/en/2.1.x/
- Django https://www.djangoproject.com/
#### Java
- SpringBoot https://spring.io/projects/spring-boot
  - Really helpful tool to initialize new projects: https://start.spring.io/
- Quarkus https://quarkus.io/
#### Go
- Gin https://gin-gonic.com/
- Gorilla http://www.gorillatoolkit.org/
### GraphQL Code Generator
- https://www.graphql-code-generator.com/ -- Define your schema and generate frontend client code and backend server code
### OpenAPI specification
- https://spec.openapis.org/oas/v3.1.0 -- Provides a language-agnostic specification that allows you to declare an API in a JSON or YAML document file (usually called openapi.yml, swagger.yaml, or similar). Use Swagger Codegen or OpenAPI Generator to take the OpenAPI document file and generate REST API server and client code, as well as documentation, in the language or framework of your choice.
### AsyncAPI specification
- https://www.asyncapi.com/ -- In the same family as OpenAPI, but focused on asynchronous, event-driven APIs rather than synchronous request/response APIs. Like OpenAPI, you create an API in a YAML document file and use tools to generate code and documentation
