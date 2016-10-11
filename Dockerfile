FROM ubuntu:14.04
MAINTAINER Nutthaphon Suwanwong

RUN apt-get install software-properties-common
RUN add-apt-repository ppa:webupd8team/java

RUN apt-get update

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer


#ADD app.js /var/www/app.js
#CMD ["/usr/bin/node", "/var/www/app.js"] 