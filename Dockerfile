
# debian wheezy + java 7u79
# 
# VERSION 0.0.1

FROM tutum/debian:wheezy

MAINTAINER Ivano Masiero <info@eivanomasiero.com>

# set env for nano editor
ENV TERM=xterm
ENV ROOT_PASS="password"

# install some utils
RUN apt-get update && apt-get install -y \
nano \
zip \
unzip

RUN apt-get update \
	&& apt-get install -y curl tar \
	&& (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz | tar xfz - -C /opt) \
	&& mv /opt/jdk1.7.0_79/jre /opt/jre1.7.0_79 \
	&& mv /opt/jdk1.7.0_79/lib/tools.jar /opt/jre1.7.0_79/lib/ext \
	&& rm -Rf /opt/jdk1.7.0_79 \
	&& ln -s /opt/jre1.7.0_79 /opt/java

# Set JAVA_HOME
ENV JAVA_HOME /opt/java