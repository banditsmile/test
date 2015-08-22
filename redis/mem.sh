#! /bin/bash

redis-cli info|grep used_memory:

for (( start = 100; start < 200; start++ ))
do
    for (( start2 = 100; start2 < 400; start2++ ))
    do
         redis-cli hset test$start a$start2 "1" > /dev/null
    done
done

redis-cli info|grep used_memory:
