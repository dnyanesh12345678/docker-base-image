FROM ubuntu
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install wget -y
RUN apt-get install vim -y
RUN apt-get install openjdk-8-jdk -y
WORKDIR /opt
RUN apt-get install tar -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81.tar.gz
RUN tar -zxvf apache-tomcat-8.5.81.tar.gz
RUN rm -rf apache-tomcat-8.5.81.tar.gz
RUN apt-get install openssh-server -y
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
VOLUME /opt/apache-tomcat-8.5.81/webapps
ENV PATH=$PATH:/opt/apache-tomcat-8.5.81/bin
CMD startup.sh && service ssh start && /bin/bash

