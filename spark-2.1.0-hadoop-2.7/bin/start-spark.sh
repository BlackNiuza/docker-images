#!/bin/bash

source ${SPARK_HOME}/sbin/start-master.sh -h spark -p 7077 --webui-port 8089

source ${SPARK_HOME}/sbin/start-slave.sh spark://spark:7077
