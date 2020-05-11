# Mongo

## Scaling

_Replica sets_

A group of mongodb processes that have and manage the same data.

The data is replicated to other nodes in the cluster.
Delivers:
- High availability
- Redundancy

Properties:
- Requires at least 3 nodes.
- One node is used for write operations (primary). Data is replicated to other nodes.
- If the primary node becomes unavailable, an election is held among the nodes to elect a new primary.
- Applications can be configured to send read operations so specific nodes (scaling).
- Arbiter nodes can be defined, these nodes don't contain data but can vote a new primary.

_Sharding_

Data is distributed across multiple nodes.

## Schema

MongoDB supports defining JSON schema. This can be used to validate the structure of documents inserted into collections.

