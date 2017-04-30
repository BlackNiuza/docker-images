#!/bin/bash

docker run -h node1 \
	-p 9999:22 \
	-p 9000:9000 \
	-p 8088:8088 \
	-p 50020:50020 \
	-p 50070:50070 \
	-p 50075:50075 \
	-p 50090:50090 \
	-it "blackniuza/hadoop-2.7"