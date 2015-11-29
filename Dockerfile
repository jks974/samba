FROM jks974/baseimage

MAINTAINER Jks

# Install samba
RUN apt-get install -y samba

# Copy script inside container
COPY start.sh ./start.sh

VOLUME /etc/samba
VOLUME /data

#Certains are unecessary
EXPOSE 901 1445
EXPOSE 138 139 88 445

ENTRYPOINT ["./start.sh"]
