#!/bin/bash
cp ./apache-jmeter-4.0/extras/ant-jmeter-1.1.1.jar  $ANT_HOME/lib
cd ..
ant -buildfile build.xml