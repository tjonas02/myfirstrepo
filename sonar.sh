#!/bin/bash
#This is the script to install sonarqube on the server
# Author: Jonas T.
# Date : 2/23/2022

sudo yum update -y
sleep 2
echo "This is to install java 11"
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
sleep 2
echo "Download Sonarqube latest version on the server"
cd /opt 
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo " Changing the ownership too the user and switch to Linux binaries directory 
to start service"
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
#If firewall is close then run these command"
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
