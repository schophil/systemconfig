# Queue

## RabbitMQ

### Concepts

Common queue constructs: producer, consumer, queue

_Exchange_

Producers never send directly to queue. Instead they send to an exchange.
The exchange listens to producers and sends to queues using a specific algorithm:
1. direct: Send messages to to all queues based on a single routing key (for example: [log severity]).
2. topic: Same as direct but using complex routing keys containing several properties (for example: log.[app].[severity]).
3. headers
4. fanout: Broadcast the messages to all queues known by the exchange.

Before a queue can be used by an exchange it needs to be _bound_ to it (binding).

### Usage scenario

_Work queue_

_Publish/Subscribe_

Deliver the same message to different consumers.

We use a fanout exchange.

Queues are bound to the exchange.

When publishing on the exchange, messages will be pushed to all queues.

_Routing_

Queues are bound to the exchange with a specific bindingKey.

Deliver messages with a specific routingKey to the queues bound with the same bindingKey.
Where routingKey = bindingKey.

This can be used to send _some_ messages to specific consumers.

We use a direct exchange with routing keys.

_Topic_


