#!/usr/bin/env bash

CMD=$1

case $CMD in
  (jobmanager-start)
    echo "Starting the Flink JobManager."
    exec sudo service flink-jobmanager start
    ;;
  (jobmanager-stop)
    echo "Stopping the Flink JobManager."
    exec sudo service flink-jobmanager stop
    ;;
  (taskmanager-start)
    echo "Starting the Flink TaskManager."
    exec sudo service flink-taskmanager start
    ;;
  (taskmanager-stop)
    echo "Stopping the Flink TaskManager."
    exec sudo service flink-taskmanager stop
    ;;
  (*)
    echo "Don't understand [$CMD]"
    ;;
esac