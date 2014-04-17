#!/bin/bash
cd ~
if  [ ! -e apache-tomcat-7.0.53.tar.gz ]
then
	wget http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz
fi
tar xvzf apache-tomcat-7.0.53.tar.gz
sudo rm -rf /usr/local/apache-tomcat-7.0.53
sudo mv apache-tomcat-7.0.53 /usr/local/
sudo chown -R $USER /usr/local/apache-tomcat-7.0.53
sudo apt-get install default-jdk
echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.bashrc
echo "export CATALINA_HOME=/usr/local/apache-tomcat-7.0.53" >> ~/.bashrc
echo "Tomcat + Java installation done!"
