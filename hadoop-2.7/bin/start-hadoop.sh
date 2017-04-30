#!/bin/bash

hdfs namenode -format
bash ${HADOOP_HOME}/sbin/start-dfs.sh
bash ${HADOOP_HOME}/sbin/start-yarn.sh