#!/bin/bash

source build.sh

docker run -h spark \
	-p 10005:22 \
	-p 7077:7077 \
	-p 8089:8089 \
	-it "blackniuza/spark-2.1.0-hadoop-2.7"