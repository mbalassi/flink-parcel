# Flink Parcel

This repository contains a parcel for [Apache Flink](flink.apache.org).

Currently it builds for Flink 1.0.3.

# Usage

Move the parcel and the checksum file to the parcel repository of your CM server.

<pre><code>
cp parcel/FLINK-1.0.3-p0-el7.parcel* /opt/cloudera/parcel-repo
</code></pre>

Navigate to `/cmf/parcel/status` on the CM WebUI by clicking _Parcels_.

Click on _Check for new Parcels_. When Flink appears Click on distribute, then activate.

Log in to one of the machines having the active Flink parcel.

Start the Flink services (JobManager - master, TaskManager - slave):

<pre><code>
export JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera/; service flink-jobmanager start
export JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera/; service flink-taskmanager start
</code></pre>

Now you should be able to see the Flink WebUI on port 8081 on this host.

To run the WordCount example you can do the following:

<pre><code>
export JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera/;flink run /opt/cloudera/parcels/FLINK/usr/lib/flink/examples/batch/WordCount.jar --input /opt/cloudera/parcels/FLINK/usr/lib/flink/README.txt
</code></pre>

It should produce the following output:

<pre><code>
Usage: WordCount --input <path> --output <path>
Printing result to stdout. Use --output to specify output path.
06/28/2016 06:32:31	Job execution switched to status RUNNING.
06/28/2016 06:32:31	CHAIN DataSource (at main(WordCount.java:71) (org.apache.flink.api.java.io.TextInputFormat)) -> FlatMap (FlatMap at main(WordCount.java:79)) -> Combine(SUM(1), at main(WordCount.java:79)(1/1) switched to SCHEDULED 
06/28/2016 06:32:31	CHAIN DataSource (at main(WordCount.java:71) (org.apache.flink.api.java.io.TextInputFormat)) -> FlatMap (FlatMap at main(WordCount.java:79)) -> Combine(SUM(1), at main(WordCount.java:79)(1/1) switched to DEPLOYING 
06/28/2016 06:32:31	CHAIN DataSource (at main(WordCount.java:71) (org.apache.flink.api.java.io.TextInputFormat)) -> FlatMap (FlatMap at main(WordCount.java:79)) -> Combine(SUM(1), at main(WordCount.java:79)(1/1) switched to RUNNING 
06/28/2016 06:32:32	Reduce (SUM(1), at main(WordCount.java:79)(1/1) switched to SCHEDULED 
06/28/2016 06:32:32	Reduce (SUM(1), at main(WordCount.java:79)(1/1) switched to DEPLOYING 
06/28/2016 06:32:32	CHAIN DataSource (at main(WordCount.java:71) (org.apache.flink.api.java.io.TextInputFormat)) -> FlatMap (FlatMap at main(WordCount.java:79)) -> Combine(SUM(1), at main(WordCount.java:79)(1/1) switched to FINISHED 
06/28/2016 06:32:32	Reduce (SUM(1), at main(WordCount.java:79)(1/1) switched to RUNNING 
06/28/2016 06:32:32	DataSink (collect())(1/1) switched to SCHEDULED 
06/28/2016 06:32:32	DataSink (collect())(1/1) switched to DEPLOYING 
06/28/2016 06:32:32	Reduce (SUM(1), at main(WordCount.java:79)(1/1) switched to FINISHED 
06/28/2016 06:32:32	DataSink (collect())(1/1) switched to RUNNING 
06/28/2016 06:32:32	DataSink (collect())(1/1) switched to FINISHED 
06/28/2016 06:32:32	Job execution switched to status FINISHED.
(1,1)
(13,1)
(5d002,1)
(740,1)
(about,1)
(account,1)
(administration,1)
(algorithms,1)
(and,7)
(another,1)
...
</code></pre>


