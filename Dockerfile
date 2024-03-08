FROM alpine:latest

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

RUN apk update && apk upgrade
RUN apk add -v --no-cache mongodb
#RUN apk add openssh

#CMD rc-update add sshd && rc-service sshd start

CMD mkdir -p /data/db

VOLUME ["/data/db"]
EXPOSE 27017 28017
EXPOSE 27018 28018
EXPOSE 27019 28019

COPY run.sh /root
CMD /root/run.sh
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]
