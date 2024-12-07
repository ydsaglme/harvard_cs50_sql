# From the Deep
In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
It ensures load balancing and scalability by evenly distributing, however multiple partitions must be queried to extract a meaningful output from the provided data. Which, in the end, increases overhead.

## Partitioning by Hour
Query performance will be optimized, thanks to keeping all the related datas together. On the other hand, there will be overloads in some parts due to uneven distribution.

## Partitioning by Hash Value
Load will be balanced, thanks to even distribution. Other than that, user may not need to create queries, if the hash value is known. Except this scenario, the action is mandatory.
