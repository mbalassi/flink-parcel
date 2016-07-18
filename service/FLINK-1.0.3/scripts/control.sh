#!/usr/bin/env bash

CMD=$1

case $CMD in
  (jobmanager-start)
    echo "Starting the Flink JobManager."
    exec service flink-jobmanager start
    ;;
  (jobmanager-stop)
    echo "Stopping the Flink JobManager."
    exec service flink-jobmanager stop
    ;;
  (taskmanager-start)
    echo "Starting the Flink TaskManager."
    exec service flink-taskmanager start
    ;;
  (taskmanager-stop)
    echo "Stopping the Flink TaskManager."
    exec service flink-taskmanager stop
    ;;
  (*)
    echo "Don't understand [$CMD]"
    ;;
esac