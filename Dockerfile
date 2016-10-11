FROM ubuntu:14.04

MAINTAINER Nutthaphon Suwanwong

ENV JVM_ARGS "-Xms128m -Xmx256m"
ENV SERVER_PORT 1099
ENV JMETER_HOME apache-jmeter-3.0

RUN echo deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/java-8-ubuntu.list
	echo deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main >> /etc/apt/sources.list.d/java-8-ubuntu.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	apt-get update
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
	apt-get install -y oracle-java8-installer

WORKDIR /root

RUN wget http://www-us.apache.org/dist//jmeter/binaries/apache-jmeter-3.0.tgz
	tar xzvf apache-jmeter-3.0.tgz
	
EXPOSE SERVER_PORT

CMD ${JMETER_HOME}/bin/jmeter-server

