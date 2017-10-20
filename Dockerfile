FROM ubuntu:14.04
FROM openjdk:7-jdk
MAINTAINER "Kwame Porter Robinson" kporterrobinson@gmail.com

RUN apt-get update &&\
    apt-get -y install git build-essential libboost-program-options-dev libboost-python-dev zlib1g-dev  &&\
    git clone git://github.com/JohnLangford/vowpal_wabbit.git /vowpal_wabbit &&\
    cd /vowpal_wabbit && make && make install &&\
    rm -Rf /vowpal_wabbit/* && apt-get -y remove git &&\
    apt-get -y autoremove

RUN apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ./
COPY run.sh run.sh
RUN chmod a+x run.sh
ENTRYPOINT ["./run.sh"]
