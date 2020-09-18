FROM debian:buster

MAINTAINER tlecoeuv@student.42.fr

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install nginx mariadb-server php7.3-fpm php7.3-mysql wget

ADD ./srcs/* srcs_docker/

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["srcs_docker/script.sh"]
