#!/bin/bash
cd ~
sudo apt-get install tomcat7
wget http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz
tar xvzf apache-tomcat-7.0.53.tar.gz
sudo mv apache-tomcat-7.0.53 /usr/local/
sudo apt-get install default-jdk
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.bashrc
echo "export CATALINA_HOME=/usr/local/apache-tomcat-7.0.53" >> ~/.bashrc
echo "Tomcat + Java installation done!"
