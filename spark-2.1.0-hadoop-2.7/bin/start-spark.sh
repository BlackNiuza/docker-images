#!/bin/bash

source ${SPARK_HOME}/sbin/start-master.sh -h spark -p 7077 --webui-port 8089

source ${SPARK_HOME}/sbin/start-slave.sh spark://spark:7077

# test
${SPARK_HOME}/bin/spark-submit --master spark://spark:7077 --class "org.apache.spark.examples.SparkPi" ${SPARK_HOME}/examples/jars/spark-examples_2.11-2.1.0.jar 